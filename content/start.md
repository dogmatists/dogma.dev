---
title: "Dogma: Getting Started"
---

# Getting Started

## Summary

Language        | Code
:---------------| --------------------------------------------------------------
[C][]           | `#include <dogma.h>`
[C++][]         | `#include <dogma.hpp>`
[Dart][]        | `import 'package:dogma/dogma.dart';`
[Protobuf][]    | `import "dogma.proto";`
[Python][]      | `import dogma`
[Ruby][]        | `require 'dogma'`
[Zig][]         | `const dogma = @import("dogma");`

[C]:        https://github.com/dogmatists/dogma.c
[C++]:      https://github.com/dogmatists/dogma.cpp
[Dart]:     https://github.com/dogmatists/dogma.dart
[Protobuf]: https://github.com/dogmatists/dogma.pb
[Python]:   https://github.com/dogmatists/dogma.py
[Ruby]:     https://github.com/dogmatists/dogma.rb
[Zig]:      https://github.com/dogmatists/dogma.zig

## Loading the library

=== "C"

    ```c
    #include <dogma.h>
    ```

=== "C++"

    ```c++
    #include <dogma.hpp>
    ```

=== "Dart"

    ```dart
    import 'package:dogma/dogma.dart';
    ```

=== "Protobuf"

    ```protobuf
    import "dogma.proto";
    ```

=== "Python"

    ```python
    import dogma
    ```

=== "Ruby"

    ```ruby
    require 'dogma'
    ```

=== "Zig"

    ```zig
    const dogma = @import("dogma");
    ```

## Checking the library version

=== "C"

    ```c
    printf("Dogma for C %d.%d.%d\n",
        DOGMA_VERSION_MAJOR, DOGMA_VERSION_MINOR, DOGMA_VERSION_PATCH);
    ```

=== "C++"

    ```c++
    std::printf("Dogma for C++ %d.%d.%d\n",
        dogma::version::major, dogma::version::minor, dogma::version::patch);
    ```

=== "Dart"

    ```dart
    // TODO
    ```

=== "Python"

    ```python
    # TODO
    ```

=== "Ruby"

    ```ruby
    # TODO
    ```

=== "Zig"

    ```zig
    // TODO
    ```

## Naming conventions
