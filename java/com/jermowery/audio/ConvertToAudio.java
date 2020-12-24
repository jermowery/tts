package com.jermowery.audio;

import com.google.api.core.ApiFuture;
import com.google.cloud.texttospeech.v1beta1.AudioConfig;
import com.google.cloud.texttospeech.v1beta1.AudioEncoding;
import com.google.cloud.texttospeech.v1beta1.SynthesisInput;
import com.google.cloud.texttospeech.v1beta1.SynthesizeSpeechRequest;
import com.google.cloud.texttospeech.v1beta1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1beta1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1beta1.VoiceSelectionParams;
import com.google.common.base.Functions;
import com.google.common.collect.ImmutableList;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.JdkFutureAdapters;
import com.google.inject.Inject;
import com.google.protobuf.ByteString;
import com.jermowery.audio.args.Annotations.InputFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.stream.Collector;

public class ConvertToAudio {

  private static final Collector<ByteString, ByteString, ByteString> BYTE_STRING_CONCAT_COLLECTOR = Collector
      .of(() -> ByteString.EMPTY, ByteString::concat, ByteString::concat, Functions.identity());

  private final File file;
  private final FromTextSsmlProvider fromTextSsmlProvider;

  @Inject
  public ConvertToAudio(@InputFile File file, FromTextSsmlProvider fromTextSsmlProvider) {
    this.file = file;
    this.fromTextSsmlProvider = fromTextSsmlProvider;
  }

  public void run() throws Exception {
    try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
      ImmutableList<ByteString> audioContents = Futures.allAsList(
          fromTextSsmlProvider.getBlocks(file.toURI().toURL()).stream()
              .map(text -> getFuture(textToSpeechClient, text))
              .map(JdkFutureAdapters::listenInPoolThread)
              .collect(ImmutableList.toImmutableList())).get().stream()
          .map(SynthesizeSpeechResponse::getAudioContent).collect(ImmutableList.toImmutableList());

      ByteString combined = ByteString.EMPTY;

      for (ByteString block : audioContents) {
        combined = combined.concat(block);
      }

      try (OutputStream out = new FileOutputStream("combined.mp3")) {
        out.write(combined.toByteArray());
        System.out.printf("Audio content written to file \"%s\"\n", "combined.mp3");
      }

      // for (int i = 0; i < audioContents.size(); i++) {
      //   String fileName = String.format("output-%s.mp3", i);
      //   try (OutputStream out = new FileOutputStream(fileName)) {
      //     out.write(audioContents.get(i).toByteArray());
      //     System.out.printf("Audio content written to file \"%s\"\n", fileName);
      //   }
      // }

    }
  }

  private ApiFuture<SynthesizeSpeechResponse> getFuture(TextToSpeechClient client, String text) {
    // Set the text input to be synthesized
    SynthesisInput input = SynthesisInput.newBuilder()
        .setSsml(text)
        .build();

    // Build the voice request
    VoiceSelectionParams voice = VoiceSelectionParams.newBuilder()
        .setName("en-US-Wavenet-A")
        .setLanguageCode("en-US") // languageCode = "en_us"
        .build();

    // Select the type of audio file you want returned
    AudioConfig audioConfig = AudioConfig.newBuilder()
        .setAudioEncoding(AudioEncoding.MP3) // MP3 audio.
        .build();
    SynthesizeSpeechRequest request = SynthesizeSpeechRequest.newBuilder()
        .setAudioConfig(audioConfig).setVoice(voice).setInput(input).build();
    System.out.println("Making request");
    return client.synthesizeSpeechCallable().futureCall(request);
  }
}
