// This is free and unencumbered software released into the public domain.

#pragma once

#include "math.h"

/**
 * @see https://dogma.dev/Angle
 */
typedef struct Angle {
  double radians;
} Angle;

/// Constructs an angle from radians.
static inline Angle AngleFromRadians(const double radians) {
  return (Angle){radians};
}

/// Constructs an angle from degrees.
static inline Angle AngleFromDegrees(const double degrees) {
  return (Angle){degrees / 180.0 * M_PI};
}

/// Constructs an angle from turns.
static inline Angle AngleFromTurns(const double turns) {
  return (Angle){turns * 2 * M_PI};
}

/// The angle in radians.
static inline double AngleToRadians(const Angle angle) {
  return angle.radians;
}

/// The angle in degrees.
static inline double AngleToDegrees(const Angle angle) {
  return angle.radians / M_PI * 180.0;
}

/// The angle in turns.
static inline double AngleToTurns(const Angle angle) {
  return angle.radians / (2 * M_PI);
}
