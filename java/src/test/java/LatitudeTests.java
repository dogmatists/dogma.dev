/* This is free and unencumbered software released into the public domain. */

import static org.junit.jupiter.api.Assertions.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.junit.jupiter.api.Test;

import dogma.Latitude;

public class LatitudeTests {
  @Test
  void testValid() {
    assertEquals(0, Latitude.of(0).getDegrees());
    assertEquals(-90, Latitude.of(-90).getDegrees());
    assertEquals(90, Latitude.of(90).getDegrees());
  }

  @Test
  void testInvalid() {
    assertThrows(IllegalArgumentException.class, () -> Latitude.of(-91));
    assertThrows(IllegalArgumentException.class, () -> Latitude.of(91));
  }

  @Test
  void testJacksonJSON() {
    final Latitude latitude = Latitude.of(42.12345678);
    assertDoesNotThrow(() -> {
      assertEquals("42.12345678", new ObjectMapper().writeValueAsString(latitude));
    });
  }

  @Test
  void testGsonJSON() {
    final Latitude latitude = Latitude.of(42.12345678);
    assertDoesNotThrow(() -> {
      final Gson gson = new GsonBuilder()
          .registerTypeHierarchyAdapter(Latitude.class, new Latitude.GsonSerializer())
          .create();
      assertEquals("42.12345678", gson.toJson(latitude));
    });
  }
}
