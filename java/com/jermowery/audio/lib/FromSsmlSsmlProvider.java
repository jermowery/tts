package com.jermowery.audio.lib;

import com.google.common.collect.ImmutableList;
import com.google.common.io.CharStreams;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class FromSsmlSsmlProvider implements SsmlProvider {

  @Override
  public ImmutableList<String> getBlocks(Readable readable) throws IOException {
    ImmutableList<String> result = ImmutableList.of(CharStreams.toString(readable));
    return result;
  }

  @Override
  public ImmutableList<String> getBlocks(URL url) throws IOException {
    return getBlocks(new InputStreamReader(url.openStream()));
  }
}
