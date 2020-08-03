/* This is free and unencumbered software released into the public domain. */

import 'dart:math' as math;

import 'package:test/test.dart';

import 'package:dogma/dogma.dart' show Angle;

void main() {
  group('Angle', () {
    test('Angle.fromDegrees() constructs the angle from degrees', () {
      expect(Angle.fromDegrees(0).degrees, equals(0));
      expect(Angle.fromDegrees(90).degrees, equals(90));
      expect(Angle.fromDegrees(180).degrees, equals(180));
      expect(Angle.fromDegrees(360).degrees, equals(360));
    });

    test('Angle.fromRadians() constructs the angle from radians', () {
      expect(Angle.fromRadians(0).radians, equals(0));
      expect(Angle.fromRadians(0.5 * math.pi).radians, equals(0.5 * math.pi));
      expect(Angle.fromRadians(math.pi).radians, equals(math.pi));
      expect(Angle.fromRadians(2 * math.pi).radians, equals(2 * math.pi));
    });

    test('Angle.fromTurns() constructs the angle from turns', () {
      expect(Angle.fromTurns(0).turns, equals(0));
      expect(Angle.fromTurns(0.25).turns, equals(0.25));
      expect(Angle.fromTurns(0.5).turns, equals(0.5));
      expect(Angle.fromTurns(1).turns, equals(1));
    });
  });
}
