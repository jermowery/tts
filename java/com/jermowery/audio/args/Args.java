package com.jermowery.audio.args;

import com.beust.jcommander.IStringConverter;
import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Parameters(separators = "=")
public class Args {

  @Parameter
  private List<String> parameters = new ArrayList<>();

  @Parameter(names = "--file", description = "The file to convert", converter = ToFile.class, required = true)
  private File file;

  @Parameter(names = "--voice", description = "The voice model to use")
  private String voice = "en-US-Wavenet-E";

  public File getFile() {
    return file;
  }

  public String getVoice() {
    return voice;
  }


  private class ToFile implements IStringConverter<File> {

    @Override
    public File convert(String value) {
      return new File(value);
    }
  }
}
