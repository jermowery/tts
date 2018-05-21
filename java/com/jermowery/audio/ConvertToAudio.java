package com.jermowery.audio;

import com.google.inject.Inject;
import com.jermowery.audio.args.Args;

public class ConvertToAudio {
  private final Args args;

  @Inject
  public ConvertToAudio(Args args) {
    this.args = args;
  }

  public void run() {
    System.out.printf("Voice: %s, File: %s\n", args.getVoice(), args.getFile());
  }
}
