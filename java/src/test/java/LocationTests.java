/* This is free and unencumbered software released into the public domain. */

import static org.junit.jupiter.api.Assertions.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.junit.jupiter.api.Test;

import dogma.Latitude;
import dogma.Location;
import dogma.Longitude;

public class LocationTests {
  @Test
  void testValid() {
    final Location location = Location.of(1, 2);
    assertNotNull(location.getLatitude());
    assertNotNull(location.getLongitude());
    assertEquals(1, location.getLatitude().getDegrees());
    assertEquals(2, location.getLongitude().getDegrees());
  }

  @Test
  void testInvalidLatitude() {
    assertThrows(IllegalArgumentException.class, () -> Location.of(-91, 0));
    assertThrows(IllegalArgumentException.class, () -> Location.of(91, 0));
  }

  @Test
  void testInvalidLongitude() {
    assertThrows(IllegalArgumentException.class, () -> Location.of(0, -181));
    assertThrows(IllegalArgumentException.class, () -> Location.of(0, 181));
  }

  @Test
  void testJacksonJSON() {
    final Location location = Location.of(-10.12345678, 20.12345678);
    assertDoesNotThrow(() -> {
      assertEquals("{\"latitude\":-10.12345678,\"longitude\":20.12345678}",
          new ObjectMapper().writeValueAsString(location));
    });
  }

  @Test
  void testGsonJSON() {
    final Location location = Location.of(-10.12345678, 20.12345678);
    assertDoesNotThrow(() -> {
      Gson gson = new GsonBuilder()
          .registerTypeHierarchyAdapter(Latitude.class, new Latitude.GsonSerializer())
          .registerTypeHierarchyAdapter(Longitude.class, new Longitude.GsonSerializer())
          .create();
      assertEquals("{\"latitude\":-10.12345678,\"longitude\":20.12345678}",
          gson.toJson(location));
    });
  }
}
