package com.jermowery.audio.lib;

import com.google.common.collect.ImmutableList;
import java.io.IOException;
import java.net.URL;

/**
 * Interface for classes that can provider SSML
 */
public interface SsmlProvider {

  /**
   * The max size of an SSML block. This is determined by the GCP API.
   */
  int MAX_BLOCK_SIZE_CHARS = 5000;

  /**
   * Returns a list of blocks of SSML that will be no longer than {@link #MAX_BLOCK_SIZE_CHARS}.
   */
  ImmutableList<String> getBlocks(URL url) throws IOException;
}
