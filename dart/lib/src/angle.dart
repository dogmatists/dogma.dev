/* This is free and unencumbered software released into the public domain. */

import 'dart:math' as math;

/// An angle.
///
/// See: https://dogma.dev/Angle
class Angle {
  /// The angle in radians.
  final double radians;

  /// Constructs an angle from radians.
  const Angle(this.radians);

  /// Constructs an angle from radians.
  const Angle.fromRadians(final double radians) : radians = radians;

  /// Constructs an angle from degrees.
  const Angle.fromDegrees(final double degrees)
      : radians = degrees / 180 * math.pi;

  /// Constructs an angle from turns.
  const Angle.fromTurns(final double turns) : radians = turns * 2 * math.pi;

  /// The angle in degrees.
  double get degrees => radians / math.pi * 180;

  /// The angle in turns.
  double get turns => radians / (2 * math.pi);
}
