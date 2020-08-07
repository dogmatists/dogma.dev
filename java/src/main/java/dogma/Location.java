/* This is free and unencumbered software released into the public domain. */

package dogma;

import androidx.annotation.NonNull;

@com.fasterxml.jackson.annotation.JsonPropertyOrder({ "latitude", "longitude" })
public interface Location {
  /** Constructs a location from a latitude and longitude given as degrees. */
  @NonNull
  public static Location of(final double latitude, final double longitude) {
    return new InRadians(latitude, longitude);
  }

  /** Constructs a location from a latitude and longitude. */
  @NonNull
  public static Location of(@NonNull final Latitude latitude, @NonNull final Longitude longitude) {
    return new InRadians(latitude, longitude);
  }

  /** Returns the latitude of this location. */
  @NonNull
  @com.fasterxml.jackson.annotation.JsonGetter("latitude")
  public Latitude getLatitude();

  /** Returns the longitude of this location. */
  @NonNull
  @com.fasterxml.jackson.annotation.JsonGetter("longitude")
  public Longitude getLongitude();

  class InRadians implements Location {
    private static final long serialVersionUID = 1L;

    private @NonNull final Latitude latitude;
    private @NonNull final Longitude longitude;

    protected InRadians(@NonNull final double latitude, @NonNull final double longitude) {
      this.latitude = Latitude.of(latitude);
      this.longitude = Longitude.of(longitude);
    }

    protected InRadians(@NonNull final Latitude latitude, @NonNull final Longitude longitude) {
      this.latitude = latitude;
      this.longitude = longitude;
    }

    @Override
    @NonNull
    public Latitude getLatitude() {
      return this.latitude;
    }

    @Override
    @NonNull
    public Longitude getLongitude() {
      return this.longitude;
    }
  }
}
