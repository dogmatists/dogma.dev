/* This is free and unencumbered software released into the public domain. */

import 'angle.dart' show Angle;

/// A longitude.
///
/// See: https://dogma.dev/Longitude
class Longitude extends Angle {
  static const int minDegrees = -180;
  static const int maxDegrees = 180;

  const Longitude(final double degrees)
      : assert(degrees >= minDegrees),
        assert(degrees <= maxDegrees),
        super.fromDegrees(degrees);
}
