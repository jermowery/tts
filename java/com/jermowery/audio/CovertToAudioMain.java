package com.jermowery.audio;

import com.beust.jcommander.JCommander;
import com.google.inject.Guice;
import com.jermowery.audio.args.Args;
import com.jermowery.audio.args.ArgsModule;
import java.util.Arrays;

public class CovertToAudioMain {

  public static void main(String[] args) throws Exception {
    System.out.println(Arrays.toString(args));
    Args parsedArgs = new Args();
    JCommander.newBuilder()
        .addObject(parsedArgs)
        .build()
        .parse(args);
    Guice.createInjector(new ArgsModule(parsedArgs)).getInstance(ConvertToAudio.class).run();

  }
}
