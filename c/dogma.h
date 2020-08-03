// This is free and unencumbered software released into the public domain.

#pragma once

/**
 * @file
 *
 * Dogma for C.
 *
 * @see https://github.com/dogmatists/dogma.c
 */

#ifndef __cplusplus
#if __STDC_VERSION__ < 201103L
#error "<dogma.h> requires a C11 or newer compiler (CFLAGS='-std=c11')"
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

#include <errno.h>    // for errno, EDOM
#include <stdbool.h>  // for bool
#include <stddef.h>   // for size_t
#include <stdint.h>   // for {u,}int*_t

/**
 * @see https://dogma.dev/history
 */
enum {
  DOGMA_VERSION_MAJOR = 0,
  DOGMA_VERSION_MINOR = 0,
  DOGMA_VERSION_PATCH = 0,
};

/** π */
#ifndef M_PI
#define M_PI (3.14159265358979323846)
#endif

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

#ifdef __cplusplus
}  // extern "C"
#endif
