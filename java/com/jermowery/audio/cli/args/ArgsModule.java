package com.jermowery.audio.cli.args;

import com.google.inject.AbstractModule;
import com.google.inject.Provides;
import com.google.inject.Singleton;
import com.jermowery.audio.cli.args.Annotations.InputFile;
import com.jermowery.audio.cli.args.Annotations.Voice;
import java.io.File;

public class ArgsModule extends AbstractModule {
  private final Args args;

  public ArgsModule(Args args) {
    this.args = args;
  }

  @Provides
  @Voice
  @Singleton
  String getVoice() {
   return args.getVoice();
  }

  @Provides
  @InputFile
  @Singleton
  File getInputFile() {
    return args.getFile();
  }

}
