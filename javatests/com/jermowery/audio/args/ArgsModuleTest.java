package com.jermowery.audio.args;

import static com.google.common.truth.Truth.assertThat;
import static org.mockito.Mockito.when;

import java.io.File;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;

@RunWith(JUnit4.class)
public class ArgsModuleTest {

  @Rule
  public MockitoRule mockitoRule = MockitoJUnit.rule();

  @Mock
  private Args args;

  private ArgsModule module;

  @Before
  public void setUp() {
    module = new ArgsModule(args);
  }

  @Test
  public void getVoice() {
    String voice = "voice";
    when(args.getVoice()).thenReturn(voice);

    assertThat(module.getVoice()).isEqualTo(voice);
  }

  @Test
  public void getInputFile() {
    File file = new File("faraway rooster");
    when(args.getFile()).thenReturn(file);

    assertThat(module.getInputFile()).isEqualTo(file);
  }

}
