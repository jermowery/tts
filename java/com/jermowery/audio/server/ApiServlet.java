package com.jermowery.audio.server;

import com.google.api.core.ApiFuture;
import com.google.cloud.texttospeech.v1.AudioConfig;
import com.google.cloud.texttospeech.v1.AudioEncoding;
import com.google.cloud.texttospeech.v1.SynthesisInput;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechRequest;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
import com.google.common.collect.ImmutableList;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.JdkFutureAdapters;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.protobuf.ByteString;
import com.jermowery.audio.lib.FromTextSsmlProvider;
import com.jermowery.audio.lib.SsmlProvider;
import com.jermowery.audio.server.ConvertRequest.Part;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.google.common.util.concurrent.RateLimiter;

public class ApiServlet implements HttpHandler {

  private static final Logger logger =
      Logger.getLogger(ApiServlet.class.getName());
  private static final Gson GSON = new GsonBuilder().create();

  private final SsmlProvider ssmlProvider = new FromTextSsmlProvider();
  private final ExecutorService executor = Executors.newFixedThreadPool(100);
  private final RateLimiter requestsPerSecondLimiter = RateLimiter.create(4.0);

  @Override
  public void handle(HttpExchange httpExchange) throws IOException {
    httpExchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*");

    if (httpExchange.getRequestMethod().equalsIgnoreCase("OPTIONS")) {
      logger.info("OPTIONS request");
      httpExchange.getResponseHeaders().add("Access-Control-Allow-Methods", "POST, OPTIONS");
      httpExchange.getResponseHeaders()
          .add("Access-Control-Allow-Headers", "Content-Type,Authorization");
      httpExchange.sendResponseHeaders(204, -1);
      return;
    }

    if (!httpExchange.getRequestMethod().equals("POST")) {
      String response = "This method only supports POST";
      httpExchange.sendResponseHeaders(405, response.length());
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response.getBytes());
      outputStream.flush();
      outputStream.close();
      return;
    }

    ConvertRequest request = null;
    try (Reader reader = new InputStreamReader(httpExchange.getRequestBody())) {
      request = GSON.fromJson(reader, ConvertRequest.class);
    } catch (Exception e) {
      logger.log(Level.SEVERE, "Failed to convert request JSON to AutoValue", e);
      StringWriter sw = new StringWriter();
      PrintWriter pw = new PrintWriter(sw);
      e.printStackTrace(pw);
      String response = sw.toString();

      httpExchange.sendResponseHeaders(400, response.length());
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response.getBytes());
      outputStream.flush();
      outputStream.close();
      return;
    }
    logger.info(String.format("Request:\n%s", request));

    ByteString responseAudioBytes = ByteString.EMPTY;

    try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
      ImmutableList.Builder<ByteString> combinedAudioForEachPart = ImmutableList.builder();

      for (Part part : request.getParts()) {
        ImmutableList<ByteString> audioContents = Futures.allAsList(
            ssmlProvider.getBlocks(new StringReader(part.getText())).stream()
                .map(text -> getFuture(textToSpeechClient, text, part.getVoice()))
                .map(future -> JdkFutureAdapters.listenInPoolThread(future, executor))
                .collect(ImmutableList.toImmutableList())).get().stream()
            .map(SynthesizeSpeechResponse::getAudioContent)
            .collect(ImmutableList.toImmutableList());

        ByteString combined = ByteString.EMPTY;

        for (ByteString block : audioContents) {
          combined = combined.concat(block);
        }

        combinedAudioForEachPart.add(combined);
      }

      for (ByteString block : combinedAudioForEachPart.build()) {
        responseAudioBytes = responseAudioBytes.concat(block);
      }
    } catch (Exception e) {
      logger.log(Level.SEVERE, "Failed to convert to audio", e);
      StringWriter sw = new StringWriter();
      PrintWriter pw = new PrintWriter(sw);
      e.printStackTrace(pw);
      String response = sw.toString();

      httpExchange.sendResponseHeaders(500, response.length());
      OutputStream outputStream = httpExchange.getResponseBody();
      outputStream.write(response.getBytes());
      outputStream.flush();
      outputStream.close();
      return;
    }

    httpExchange.getResponseHeaders().set("Content-Type", "audio/mpeg");
    httpExchange.getResponseHeaders()
        .set("Content-Disposition", "attachment; filename=\"combined.mp3\"");
    httpExchange.sendResponseHeaders(200, responseAudioBytes.toByteArray().length);
    OutputStream outputStream = httpExchange.getResponseBody();
    outputStream.write(responseAudioBytes.toByteArray());
    outputStream.flush();
    outputStream.close();
  }


  private ApiFuture<SynthesizeSpeechResponse> getFuture(TextToSpeechClient client, String text,
      String requestedVoice) {
    // Set the text input to be synthesized
    SynthesisInput input = SynthesisInput.newBuilder()
        .setSsml(text)
        .build();

    // Build the voice request
    VoiceSelectionParams voice = VoiceSelectionParams.newBuilder()
        .setName(requestedVoice)
        .setLanguageCode("en-US") // languageCode = "en_us"
        .build();

    // Select the type of audio file you want returned
    AudioConfig audioConfig = AudioConfig.newBuilder()
        .setAudioEncoding(AudioEncoding.MP3) // MP3 audio.
        .build();
    SynthesizeSpeechRequest request = SynthesizeSpeechRequest.newBuilder()
        .setAudioConfig(audioConfig).setVoice(voice).setInput(input).build();
    logger.info("Acquiring request permit");
    double requestSleepTime = requestsPerSecondLimiter.acquire();
    logger.info("Request sleep time: " + requestSleepTime);
    logger.info("Making request after sleeping for " + sleepTime);
    return client.synthesizeSpeechCallable()
        .futureCall(request);
  }
}
