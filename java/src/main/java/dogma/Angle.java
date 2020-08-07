/* This is free and unencumbered software released into the public domain. */

package dogma;

import androidx.annotation.NonNull;

public interface Angle {
  /** Constructs an angle from degrees. */
  @NonNull
  public static Angle fromDegrees(final double degrees) {
    return new InRadians(degrees / 180.0 * Math.PI);
  }

  /** Constructs an angle from radians. */
  @NonNull
  public static Angle fromRadians(final double radians) {
    return new InRadians(radians);
  }

  /** Constructs an angle from turns. */
  @NonNull
  public static Angle fromTurns(final double turns) {
    return new InRadians(turns * 2 * Math.PI);
  }

  /** Returns this angle in degrees. */
  default public double getDegrees() {
    return this.getRadians() / Math.PI * 180.0;
  }

  /** Returns this angle in radians. */
  public double getRadians();

  /** Returns this angle in turns. */
  default public double getTurns() {
    return this.getRadians() / (2 * Math.PI);
  }

  class InRadians implements Angle {
    private static final long serialVersionUID = 1L;

    private final double radians;

    protected InRadians(final double radians) {
      this.radians = radians;
    }

    @Override
    public double getRadians() {
      return this.radians;
    }
  }
}
