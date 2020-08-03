/* This is free and unencumbered software released into the public domain. */

import 'package:test/test.dart';

import 'package:dogma/dogma.dart' show Longitude;

void main() {
  group('Longitude', () {
    test('Longitude(degrees) constructs the longitude from degrees', () {
      expect(Longitude(0).degrees, equals(0));
      expect(Longitude(-180).degrees, equals(-180));
      expect(Longitude(180).degrees, equals(180));
    });

    test('Longitude(degrees) where degrees > ±180° throws an ArgumentError',
        () {
      expect(() => Longitude(-181), throwsA(isA<AssertionError>()));
      expect(() => Longitude(181), throwsA(isA<AssertionError>()));
    });
  });
}
