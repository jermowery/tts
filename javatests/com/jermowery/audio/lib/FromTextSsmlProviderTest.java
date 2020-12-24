package com.jermowery.audio.lib;

import static com.google.common.truth.Truth.assertThat;
import static org.junit.Assert.fail;

import com.google.common.collect.ImmutableList;
import java.io.File;
import java.io.IOException;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class FromTextSsmlProviderTest {

  private FromTextSsmlProvider fromTextSsmlProvider;

  @Before
  public void setUp() {
    fromTextSsmlProvider = new FromTextSsmlProvider();
  }

  @Test
  public void getBlocks_fileDoesNotExist() throws Exception {
    File file = new File("dne.txt");

    try {
      fromTextSsmlProvider.getBlocks(file.toURI().toURL());
      fail("Expected getBlocks to throw IOException!");
    } catch (IOException e) {
      // Expected.
    }
  }

  @Test
  public void getBlocks_smallFile() throws Exception {
    File file = new File("javatests/com/jermowery/audio/lib/test1.txt");

    ImmutableList<String> actual = fromTextSsmlProvider.getBlocks(file.toURI().toURL());

    assertThat(actual).hasSize(1);
  }

  @Test
  public void getBlocks_largeFile() throws Exception {
    File file = new File("javatests/com/jermowery/audio/lib/test2.txt");

    ImmutableList<String> actual = fromTextSsmlProvider.getBlocks(file.toURI().toURL());

    System.err.println(actual);

    assertThat(actual).hasSize(77);
  }
}