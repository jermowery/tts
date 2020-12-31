package com.jermowery.audio.server;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.List;

public class ConvertRequest {

  private List<Part> parts = new ArrayList<Part>();

  public ImmutableList<Part> getParts() {
    return ImmutableList.copyOf(parts);
  }

  public static class Part {

    private String text = "";
    private String voice = "";
    private String type = "text";

    public String getText() {
      return text;
    }

    public String getVoice() {
      return voice;
    }

    public String getType() {
      return type;
    }

    @Override
    public String toString() {
      return "Part{" +
          "text='" + text + '\'' +
          ", voice='" + voice + '\'' +
          ", type='" + type + '\'' +
          '}';
    }
  }

  @Override
  public String toString() {
    return "ConvertRequest{" +
        "parts=" + parts +
        '}';
  }
}
