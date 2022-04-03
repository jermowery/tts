package com.jermowery.audio.server2;

import com.google.api.core.ApiFuture;
import com.google.cloud.texttospeech.v1.*;
import com.google.common.collect.ImmutableList;
import com.google.common.util.concurrent.RateLimiter;
import com.jermowery.audio.lib.FromSsmlSsmlProvider;
import com.jermowery.audio.lib.FromTextSsmlProvider;
import com.jermowery.audio.lib.SsmlProvider;
import java.io.StringReader;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
public class ApiController {
  private static final Logger logger = Logger.getLogger(ApiController.class.getName());

  private final SsmlProvider fromTextSsmlProvider = new FromTextSsmlProvider();
  private final SsmlProvider fromSsmlSsmlProvider = new FromSsmlSsmlProvider();
  private final ExecutorService executor = Executors.newFixedThreadPool(100);
  private final RateLimiter requestsPerSecondLimiter = RateLimiter.create(5.0);
  private final RateLimiter charactersPerSecondLimiter = RateLimiter.create(2500);

  @CrossOrigin
  @PostMapping(path = "/api", produces = "audio/mpeg")
  public SseEmitter getAudioFile(@RequestBody ConvertRequest request) {
    logger.info(String.format("Request:\n%s", request));

    HttpHeaders responseHeaders = new HttpHeaders();
    responseHeaders.set("Content-Disposition", "attachment; filename=\"combined.mp3\"");

    SseEmitter emitter = new SseEmitter();

    executor.submit(() -> {
      try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
        ImmutableList<Future<Void>> chunks =
            request.getParts()
                .stream()
                .flatMap(part -> {
                  SsmlProvider ssmlProvider;
                  switch (part.getType()) {
                    case "text":
                      ssmlProvider = fromTextSsmlProvider;
                      break;
                    case "ssml":
                      ssmlProvider = fromSsmlSsmlProvider;
                      break;
                    default:
                      logger.severe("Unknown part type: " + part.getType());
                      ssmlProvider = fromTextSsmlProvider;
                      break;
                  }

                  try {
                    return ssmlProvider.getBlocks(new StringReader(part.getText()))
                        .stream()
                        .map(chunk
                            -> executor.submit(()
                                                   -> emitAudio(textToSpeechClient, chunk,
                                                       part.getVoice(), emitter)));
                  } catch (Exception e) {
                    RuntimeException exception = new RuntimeException("Failed to get chunk", e);
                    emitter.completeWithError(exception);
                    throw exception;
                  }
                })
                .collect(ImmutableList.toImmutableList());

        for (Future<Void> chunkFuture : chunks) {
          chunkFuture.get();
        }
        emitter.complete();
      } catch (Exception e) {
        logger.log(Level.SEVERE, "Failed to convert to audio", e);
        emitter.completeWithError(e);
      }
    });
    return emitter;
  }

  private Void emitAudio(
      TextToSpeechClient client, String text, String requestedVoice, SseEmitter emitter) {
    // Set the text input to be synthesized
    SynthesisInput input = SynthesisInput.newBuilder().setSsml(text).build();

    // Build the voice request
    VoiceSelectionParams voice = VoiceSelectionParams.newBuilder()
                                     .setName(requestedVoice)
                                     .setLanguageCode("en-US") // languageCode = "en_us"
                                     .build();

    // Select the type of audio file you want returned
    AudioConfig audioConfig = AudioConfig.newBuilder()
                                  .setAudioEncoding(AudioEncoding.MP3) // MP3 audio.
                                  .addEffectsProfileId("large-home-entertainment-class-device")
                                  .build();
    SynthesizeSpeechRequest request = SynthesizeSpeechRequest.newBuilder()
                                          .setAudioConfig(audioConfig)
                                          .setVoice(voice)
                                          .setInput(input)
                                          .build();
    logger.info("Acquiring request permit");
    double requestSleepTime = requestsPerSecondLimiter.acquire(1);
    logger.info("Request sleep time: " + requestSleepTime);
    logger.info("Acquiring characters permits: " + text.length());
    double charactersSleepTime = charactersPerSecondLimiter.acquire(text.length());
    logger.info("Characters sleep time: " + charactersSleepTime);
    logger.info(String.format("Making request:\n%s", request));
    ApiFuture<SynthesizeSpeechResponse> response =
        client.synthesizeSpeechCallable().futureCall(request);
    try {
      emitter.send(response.get().getAudioContent().toByteArray());
    } catch (Exception e) {
      emitter.completeWithError(new RuntimeException("Unable to get audio from service", e));
    }
    return (Void) null;
  }
}
