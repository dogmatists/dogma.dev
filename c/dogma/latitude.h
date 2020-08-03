// This is free and unencumbered software released into the public domain.

#pragma once

#include "angle.h"

#include <errno.h>  // for errno, EDOM

/**
 * @see https://dogma.dev/Latitude
 */
typedef struct Latitude {
  Angle angle;
} Latitude;

enum {
  LATITUDE_MIN_DEGREES = -90,
  LATITUDE_MAX_DEGREES = 90,
};

/// Constructs a latitude.
#define Latitude(degrees) LatitudeFromDegrees(degrees)

/// Constructs a latitude.
static inline Latitude LatitudeFromDegrees(const double degrees) {
  if (degrees < LATITUDE_MIN_DEGREES) {
    return errno = EDOM, (Latitude){0};
  }
  if (degrees > LATITUDE_MAX_DEGREES) {
    return errno = EDOM, (Latitude){0};
  }
  return (Latitude){AngleFromDegrees(degrees)};
}

/// The latitude in degrees.
static inline double LatitudeToDegrees(const Latitude latitude) {
  return AngleToDegrees(latitude.angle);
}
