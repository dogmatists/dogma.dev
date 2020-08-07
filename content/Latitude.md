---
title: "Dogma: Latitude Class"
---

# Latitude class

## Diagram

```mermaid
classDiagram
    class Angle {
      -double radians
      +radians() double
      +degrees() double
      +turns() double
    }
    class Latitude
    Latitude --|> Angle : extends
```

## Summary

Language        | Type      | Symbol
:---------------| :-------- | :-------------------------------------------------
[C]             | struct    | `Latitude`
[C++]           | struct    | `dogma::Latitude`
[Dart]          | class     | [`Latitude`](https://pub.dev/documentation/dogma/latest/dogma/Latitude-class.html)
[Go]            | struct    | [`dogma.Latitude`](https://godoc.org/github.com/dogmatists/dogma.go/dogma#Latitude)
[Java]          | interface | `dogma.Latitude`
[Protobuf]      | message   | `dogma.Latitude`
[Python]        | class     | `dogma.Latitude`
[Ruby]          | class     | [`Dogma::Latitude`](https://rubydoc.info/github/dogmatists/dogma.rb/master/Dogma/Latitude)
[Rust]          | struct    | [`dogma::Latitude`](https://docs.rs/dogma/latest/dogma/struct.Latitude.html)
[Zig]           | struct    | `dogma.Latitude`

## Description

## Import

=== "C"

    ```c
    #include <dogma.h>  // for Latitude
    ```

=== "C++"

    ```c++
    #include <dogma.hpp>  // for Latitude

    using dogma::Latitude;
    ```

=== "Dart"

    ```dart
    import 'package:dogma/dogma.dart' show Latitude;
    ```

=== "Go"

    ```go
    import "github.com/dogmatists/dogma.go/dogma"
    ```

=== "Java"

    ```java
    import dogma.Latitude;
    ```

=== "Python"

    ```python
    from dogma import Latitude
    ```

=== "Ruby"

    ```ruby
    require 'dogma'

    include Dogma::Latitude
    ```

=== "Rust"

    ```rust
    extern crate dogma;

    use dogma::Latitude;
    ```

=== "Zig"

    ```zig
    const Latitude = @import("dogma").Latitude;
    ```

## Constants

### `MAX_DEGREES`

=== "C"

    ```c
    
    ```

=== "C++"

    ```c++
    
    ```

=== "Dart"

    ```dart
    
    ```

=== "Go"

    ```go
    dogma.MaxLatitudeDegrees  // 90
    ```

=== "Java"

    ```java
    Latitude.MAX_DEGREES  // 90
    ```

=== "Python"

    ```python
    
    ```

=== "Ruby"

    ```ruby
    
    ```

=== "Rust"

    ```rust
    // TODO
    ```

=== "Zig"

    ```zig
    
    ```

### `MIN_DEGREES`

=== "C"

    ```c
    
    ```

=== "C++"

    ```c++
    
    ```

=== "Dart"

    ```dart
    
    ```

=== "Go"

    ```go
    dogma.MinLatitudeDegrees  // -90
    ```

=== "Java"

    ```java
    Latitude.MIN_DEGREES  // -90
    ```

=== "Python"

    ```python
    
    ```

=== "Ruby"

    ```ruby
    
    ```

=== "Rust"

    ```rust
    // TODO
    ```

=== "Zig"

    ```zig
    
    ```

## Constructor

=== "C"

    ```c
    Latitude(27.9881)
    ```

=== "C++"

    ```c++
    Latitude{27.9881}
    ```

=== "Dart"

    ```dart
    Latitude(27.9881)
    ```

=== "Go"

    ```go
    NewLatitude(27.9881)
    ```

=== "Java"

    ```java
    Latitude.of(27.9881)
    ```

=== "Python"

    ```python
    Latitude(27.9881)
    ```

=== "Ruby"

    ```ruby
    Latitude.new(27.9881)
    ```

=== "Rust"

    ```rust
    Latitude::new(27.9881)
    ```

=== "Zig"

    ```zig
    Latitude.init(27.9881)
    ```

## Properties

## Methods

## Schema

=== "Flat Buffers"

    ```protobuf
    struct Latitude {
      angle: Angle;
    }
    ```

=== "Joi"

    ```javascript
    Joi.number().min(-90).max(90)
    ```

=== "JSON Schema"

    ```json
    {
      "type": "number",
      "minimum": -90,
      "maximum": 90
    }
    ```

=== "OWL"

    ```turtle
    dogma:Latitude
      a owl:DatatypeProperty ;
      rdfs:range xsd:double .

    []
      a owl:Restriction ;
      owl:onProperty dogma:Latitude ;
      owl:someValuesFrom [
        a rdfs:Datatype ;
        owl:onDatatype xsd:double ;
        owl:withRestrictions (
          [xsd:minInclusive "-90"^^xsd:double]
          [xsd:maxInclusive "90"^^xsd:double]
        )
      ] .
    ```

=== "Protocol Buffers"

    ```protobuf
    message Latitude {
      Angle angle = 1;
    }
    ```

=== "SQL"

    ```sql
    latitude DOUBLE PRECISION  -- in degrees from -90° to 90°
    ```

=== "XML Schema"

    ```xml
    <xs:simpleType name="Latitude">
      <xs:restriction base="xs:double">
        <xs:minInclusive value="-90"/>
        <xs:maxInclusive value="90"/>
      </xs:restriction>
    </xs:simpleType>
    ```

## Serialization

=== "JSON"

    ```json
    27.9881  // Latitude of Mt. Everest
    ```

=== "JSON-LD"

    ```json
    // TODO
    ```

=== "XML"

    ```xml
    <!-- TODO -->
    ```

## FAQs

## References

- [en.wikipedia.org/wiki/Latitude](https://en.wikipedia.org/wiki/Latitude)
- [mathworld.wolfram.com/Latitude.html](https://mathworld.wolfram.com/Latitude.html)

[C]:        https://github.com/dogmatists/dogma.c/blob/master/dogma/latitude.h
[C++]:      https://github.com/dogmatists/dogma.cpp/blob/master/dogma/latitude.hpp
[Dart]:     https://github.com/dogmatists/dogma.dart/blob/master/lib/src/latitude.dart
[Go]:       https://github.com/dogmatists/dogma.go/blob/master/dogma/latitude.go
[Java]:     https://github.com/dogmatists/dogma.java/blob/master/src/main/java/dogma/Latitude.java
[Protobuf]: https://github.com/dogmatists/dogma.pb/blob/master/src/latitude.proto
[Python]:   https://github.com/dogmatists/dogma.py/blob/master/src/dogma/latitude.py
[Ruby]:     https://github.com/dogmatists/dogma.rb/blob/master/lib/dogma/latitude.rb
[Rust]:     https://github.com/dogmatists/dogma.rs/blob/master/src/latitude.rs
[Zig]:      https://github.com/dogmatists/dogma.zig/blob/master/src/latitude.zig
