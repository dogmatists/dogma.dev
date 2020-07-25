# Angle class

## Summary

Language        | Type      | Symbol
:---------------| :-------- | :-------------------------------------------------
[C]             | struct    | `Angle`
[C++]           | struct    | `dogma::Angle`
[Dart]          | class     | `Angle`
[Protobuf]      | message   | `dogma.Angle`
[Python]        | class     | `dogma.Angle`
[Ruby]          | class     | `Dogma::Angle`
[Zig]           | struct    | `dogma.Angle`

## Description

Angles are represented using [radians], but can be constructed from radians,
[degrees], or [turns].

## Constants

## Constructor

### From degrees

Language        | Type
:---------------| :-------------------------------------------------------------
[C]             | `AngleFromDegrees(180)`
[C++]           | `Angle.from_degrees(180)`
[Dart]          | `Angle.fromDegrees(180)`
[Python]        | `Angle(degrees=180)`
[Ruby]          | `Angle.new(degrees: 180)`
[Zig]           | `Angle.fromDegrees(180)`

### From radians

Language        | Type
:---------------| :-------------------------------------------------------------
[C]             | `AngleFromRadians(M_PI)`
[C++]           | `Angle.from_radians(M_PI)`
[Dart]          | `Angle.fromRadians(math.pi)`
[Python]        | `Angle(radians=math.pi)`
[Ruby]          | `Angle.new(radians: Math::PI)`
[Zig]           | `Angle.fromRadians(std.math.pi)`

### From turns

Language        | Type
:---------------| :-------------------------------------------------------------
[C]             | `AngleFromTurns(0.5)`
[C++]           | `Angle.from_turns(0.5)`
[Dart]          | `Angle.fromTurns(0.5)`
[Python]        | `Angle(turns=0.5)`
[Ruby]          | `Angle.new(turns: 0.5)`
[Zig]           | `Angle.fromTurns(0.5)`

## Properties

### `degrees`

### `radians`

### `turns`

## Methods

[degrees]:  ../glossary.md#degree
[radians]:  ../glossary.md#radian
[turns]:    ../glossary.md#turn

[C]:        https://github.com/dogmatists/dogma.c/blob/master/dogma/angle.h
[C++]:      https://github.com/dogmatists/dogma.cpp/blob/master/dogma/angle.hpp
[Dart]:     https://github.com/dogmatists/dogma.dart/blob/master/lib/src/angle.dart
[Protobuf]: https://github.com/dogmatists/dogma.pb/blob/master/src/angle.proto
[Python]:   https://github.com/dogmatists/dogma.py/blob/master/src/dogma/angle.py
[Ruby]:     https://github.com/dogmatists/dogma.rb/blob/master/lib/dogma/angle.rb
[Zig]:      https://github.com/dogmatists/dogma.zig/blob/master/src/angle.zig
