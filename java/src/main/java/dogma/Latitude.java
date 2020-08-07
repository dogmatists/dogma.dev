/* This is free and unencumbered software released into the public domain. */

package dogma;

import androidx.annotation.FloatRange;
import androidx.annotation.NonNull;

public interface Latitude extends Angle {
  public static final int MIN_DEGREES = -90;
  public static final int MAX_DEGREES = 90;

  /** Constructs a latitude from degrees. */
  @NonNull
  public static Latitude of(final double degrees) {
    if (degrees < MIN_DEGREES || degrees > MAX_DEGREES) {
      throw new IllegalArgumentException(String.format("Latitude bounds are ±90°, but got %f°", degrees));
    }
    return new InRadians(degrees / 180.0 * Math.PI);
  }

  /** Constructs a latitude from an angle. */
  @NonNull
  public static Latitude of(@NonNull final Angle angle) {
    return of(angle.getDegrees());
  }

  /** Returns this latitude as an angle. */
  @NonNull
  default public Angle asAngle() {
    return this;
  }

  /** Returns this latitude in degrees. */
  @Override
  @FloatRange(from=-90.0, to=90.0)
  @com.fasterxml.jackson.annotation.JsonValue
  default public double getDegrees() {
    return this.getRadians() / Math.PI * 180.0;
  }

  class InRadians extends Angle.InRadians implements Latitude {
    private static final long serialVersionUID = 1L;

    protected InRadians(final double radians) {
      super(radians);
    }
  }

  public class GsonSerializer implements com.google.gson.JsonSerializer<Latitude> {
    @Override
    public com.google.gson.JsonElement serialize(
          @NonNull final Latitude latitude,
          final java.lang.reflect.Type type,
          final com.google.gson.JsonSerializationContext context) {
      return new com.google.gson.JsonPrimitive(latitude.getDegrees());
    }
  }
}
