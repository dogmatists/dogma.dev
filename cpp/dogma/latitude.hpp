// This is free and unencumbered software released into the public domain.

#pragma once

#include "angle.hpp"

#include <cerrno>  // for errno, EDOM

namespace dogma {
  struct Latitude;
}

/**
 * @see https://dogma.dev/Latitude
 */
struct dogma::Latitude {
  Angle _angle;

  Latitude() : _angle{0} {}

  Latitude(const double degrees) : _angle{Angle::from_degrees(degrees)} {
    if (degrees < min_degrees) {
      errno = EDOM;
      _angle = Angle{0};
    }
    if (degrees > max_degrees) {
      errno = EDOM;
      _angle = Angle{0};
    }
  }

  static inline constexpr int min_degrees = -90;
  static inline constexpr int max_degrees = 90;

  /// The latitude in degrees.
  inline double degrees() const {
    return _angle.degrees();
  }
};
