// This is free and unencumbered software released into the public domain.

#include "dogma.h"

#include <assert.h>  // for assert()
#include <errno.h>   // for errno, EDOM
#include <stdio.h>   // for printf()
#include <stdlib.h>  // for EXIT_SUCCESS

static void example_version(void) {
  printf("Dogma for C %d.%d.%d\n",
      DOGMA_VERSION_MAJOR, DOGMA_VERSION_MINOR, DOGMA_VERSION_PATCH);
}

static void test_Angle_radians(void) {
  assert(AngleToRadians(AngleFromRadians(0)) == 0);
  assert(AngleToRadians(AngleFromRadians(0.5 * M_PI)) == 0.5 * M_PI);
  assert(AngleToRadians(AngleFromRadians(1 * M_PI)) == 1 * M_PI);
  assert(AngleToRadians(AngleFromRadians(2 * M_PI)) == 2 * M_PI);
}

static void test_Angle_degrees(void) {
  assert(AngleToDegrees(AngleFromDegrees(0)) == 0);
  assert(AngleToDegrees(AngleFromDegrees(90)) == 90);
  assert(AngleToDegrees(AngleFromDegrees(180)) == 180);
  assert(AngleToDegrees(AngleFromDegrees(360)) == 360);
}

static void test_Angle_turns(void) {
  assert(AngleToTurns(AngleFromTurns(0)) == 0);
  assert(AngleToTurns(AngleFromTurns(0.25)) == 0.25);
  assert(AngleToTurns(AngleFromTurns(0.5)) == 0.5);
  assert(AngleToTurns(AngleFromTurns(1)) == 1);
}

static void test_Angle(void) {
  test_Angle_radians();
  test_Angle_degrees();
  test_Angle_turns();
}

static void test_Latitude(void) {
  errno = 0;
  assert(LatitudeToDegrees(Latitude(0)) == 0 && errno == 0);
  assert(LatitudeToDegrees(Latitude(-90)) == -90 && errno == 0);
  assert(LatitudeToDegrees(Latitude(90)) == 90 && errno == 0);
  errno = 0;
  assert(LatitudeToDegrees(Latitude(-91)) == 0 && errno == EDOM);
  errno = 0;
  assert(LatitudeToDegrees(Latitude(91)) == 0 && errno == EDOM);
}

static void test_Longitude(void) {
  errno = 0;
  assert(LongitudeToDegrees(Longitude(0)) == 0 && errno == 0);
  assert(LongitudeToDegrees(Longitude(-180)) == -180 && errno == 0);
  assert(LongitudeToDegrees(Longitude(180)) == 180 && errno == 0);
  errno = 0;
  assert(LongitudeToDegrees(Longitude(-181)) == 0 && errno == EDOM);
  errno = 0;
  assert(LongitudeToDegrees(Longitude(181)) == 0 && errno == EDOM);
}

int main(void) {
  example_version();

  test_Angle();
  test_Latitude();
  test_Longitude();

  return EXIT_SUCCESS;
}
