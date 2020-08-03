// This is free and unencumbered software released into the public domain.

#pragma once

/**
 * @file
 *
 * Dogma for C++.
 *
 * @see https://github.com/dogmatists/dogma.cpp
 */

#ifndef __cplusplus
#error "<dogma.hpp> requires a C++ compiler"
#endif

#if __cplusplus < 201703L
#error "<dogma.hpp> requires a C++17 or newer compiler (CXXFLAGS='-std=c++17')"
#endif

#include <cerrno>  // for errno, EDOM

/** */
namespace dogma {
  namespace version {}
}  // namespace dogma

/**
 * @see @see https://dogma.dev/history
 */
namespace dogma::version {
  static inline constexpr int major = 0;
  static inline constexpr int minor = 0;
  static inline constexpr int patch = 0;
}  // namespace dogma::version

/** π */
#ifndef M_PI
#define M_PI (3.14159265358979323846)
#endif

namespace dogma {
  struct Angle;
  struct Latitude;
  struct Longitude;
}  // namespace dogma

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
