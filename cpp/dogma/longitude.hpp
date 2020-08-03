// This is free and unencumbered software released into the public domain.

#pragma once

#include "angle.hpp"

#include <cerrno>  // for errno, EDOM

namespace dogma {
  struct Longitude;
}

/**
 * @see https://dogma.dev/Longitude
 */
struct dogma::Longitude {
  Angle _angle;

  Longitude() : _angle{0} {}

  Longitude(const double degrees) : _angle{Angle::from_degrees(degrees)} {
    if (degrees < min_degrees) {
      errno = EDOM;
      _angle = Angle{0};
    }
    if (degrees > max_degrees) {
      errno = EDOM;
      _angle = Angle{0};
    }
  }

  static inline constexpr int min_degrees = -180;
  static inline constexpr int max_degrees = 180;

  /// The longitude in degrees.
  inline double degrees() const {
    return _angle.degrees();
  }
};
