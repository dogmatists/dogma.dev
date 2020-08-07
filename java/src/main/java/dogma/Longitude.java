/* This is free and unencumbered software released into the public domain. */

package dogma;

import androidx.annotation.FloatRange;
import androidx.annotation.NonNull;

public interface Longitude extends Angle {
  public static final int MIN_DEGREES = -180;
  public static final int MAX_DEGREES = 180;

  /** Constructs a longitude from degrees. */
  @NonNull
  public static Longitude of(final double degrees) {
    if (degrees < MIN_DEGREES || degrees > MAX_DEGREES) {
      throw new IllegalArgumentException(String.format("Longitude bounds are ±180°, but got %f°", degrees));
    }
    return new InRadians(degrees / 180.0 * Math.PI);
  }

  /** Constructs a longitude from an angle. */
  @NonNull
  public static Longitude of(@NonNull final Angle angle) {
    return of(angle.getDegrees());
  }

  /** Returns this longitude as an angle. */
  @NonNull
  default public Angle asAngle() {
    return this;
  }

  /** Returns this longitude in degrees. */
  @Override
  @FloatRange(from=-180.0, to=180.0)
  @com.fasterxml.jackson.annotation.JsonValue
  default public double getDegrees() {
    return this.getRadians() / Math.PI * 180.0;
  }

  class InRadians extends Angle.InRadians implements Longitude {
    private static final long serialVersionUID = 1L;

    protected InRadians(final double radians) {
      super(radians);
    }
  }

  public class GsonSerializer implements com.google.gson.JsonSerializer<Longitude> {
    @Override
    public com.google.gson.JsonElement serialize(
          @NonNull final Longitude longitude,
          final java.lang.reflect.Type type,
          final com.google.gson.JsonSerializationContext context) {
      return new com.google.gson.JsonPrimitive(longitude.getDegrees());
    }
  }
}
