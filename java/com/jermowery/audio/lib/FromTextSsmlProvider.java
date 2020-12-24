package com.jermowery.audio.lib;

import com.google.common.base.Predicates;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableList;
import com.google.common.io.CharStreams;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

/**
 * Splits a text file into blocks. This uses newlines to split assuming that newlines are used as
 * paragraph delimiters.
 */
public class FromTextSsmlProvider implements SsmlProvider {

  @Override
  public ImmutableList<String> getBlocks(URL url) throws IOException {
    ImmutableList<String> result = CharStreams.readLines(new InputStreamReader(url.openStream())).stream()
        .filter(Predicates.not(Strings::isNullOrEmpty))
        .map(block -> String.format("<speak>%s</speak>", block))
        .collect(ImmutableList.toImmutableList());
    System.out.println("got blocks: " + result);
    return result;
  }
}
