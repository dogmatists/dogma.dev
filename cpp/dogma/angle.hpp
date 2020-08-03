// This is free and unencumbered software released into the public domain.

#pragma once

#include "math.hpp"

namespace dogma {
  struct Angle;
}

/**
 * @see https://dogma.dev/Angle
 */
struct dogma::Angle {
  double _radians;

  /// Constructs an angle from radians.
  static inline Angle from_radians(const double radians) {
    return Angle{radians};
  }

  /// Constructs an angle from degrees.
  static inline Angle from_degrees(const double degrees) {
    return Angle{degrees / 180.0 * M_PI};
  }

  /// Constructs an angle from turns.
  static inline Angle from_turns(const double turns) {
    return Angle{turns * 2 * M_PI};
  }

  /// The angle in radians.
  inline double radians() const {
    return _radians;
  }

  /// The angle in degrees.
  inline double degrees() const {
    return _radians / M_PI * 180.0;
  }

  /// The angle in turns.
  inline double turns() const {
    return _radians / (2 * M_PI);
  }
};
