/* This is free and unencumbered software released into the public domain. */

import 'angle.dart' show Angle;

/// A latitude.
///
/// See: https://dogma.dev/Latitude
class Latitude extends Angle {
  static const int minDegrees = -90;
  static const int maxDegrees = 90;

  const Latitude(final double degrees)
      : assert(degrees >= minDegrees),
        assert(degrees <= maxDegrees),
        super.fromDegrees(degrees);
}
