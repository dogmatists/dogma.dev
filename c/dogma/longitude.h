// This is free and unencumbered software released into the public domain.

#pragma once

#include "angle.h"

#include <errno.h>  // for errno, EDOM

/**
 * @see https://dogma.dev/Longitude
 */
typedef struct Longitude {
  Angle angle;
} Longitude;

enum {
  LONGITUDE_MIN_DEGREES = -180,
  LONGITUDE_MAX_DEGREES = 180,
};

/// Constructs a longitude.
#define Longitude(degrees) LongitudeFromDegrees(degrees)

/// Constructs a longitude.
static inline Longitude LongitudeFromDegrees(const double degrees) {
  if (degrees < LONGITUDE_MIN_DEGREES) {
    return errno = EDOM, (Longitude){0};
  }
  if (degrees > LONGITUDE_MAX_DEGREES) {
    return errno = EDOM, (Longitude){0};
  }
  return (Longitude){AngleFromDegrees(degrees)};
}

/// The longitude in degrees.
static inline double LongitudeToDegrees(const Longitude longitude) {
  return AngleToDegrees(longitude.angle);
}
