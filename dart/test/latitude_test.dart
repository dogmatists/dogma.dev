/* This is free and unencumbered software released into the public domain. */

import 'package:test/test.dart';

import 'package:dogma/dogma.dart' show Latitude;

void main() {
  group('Latitude', () {
    test('Latitude(degrees) constructs the latitude from degrees', () {
      expect(Latitude(0).degrees, equals(0));
      expect(Latitude(-90).degrees, equals(-90));
      expect(Latitude(90).degrees, equals(90));
    });

    test('Latitude(degrees) where degrees > ±90° throws an ArgumentError', () {
      expect(() => Latitude(-91), throwsA(isA<AssertionError>()));
      expect(() => Latitude(91), throwsA(isA<AssertionError>()));
    });
  });
}
