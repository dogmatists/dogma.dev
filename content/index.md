---
title: Dogma
---

# Dogma

!!! caution "Here be dragons"

    This is a semi-public, pre-alpha, work-in-progress project.
    
    **Caveat utilitor:**
    Assume nothing works, and you may be pleasantly surprised;
    and when it breaks, you get to keep both pieces.

**This project is presently at an early design and proof-of-concept stage.**
It is unlikely to be particularly useful as yet to anyone but its authors.

If you are interested in the project, you can keep tabs on development [at
GitHub][] and follow the author [on Twitter][] for project announcements.

[at GitHub]:  https://github.com/artob
[on Twitter]: https://twitter.com/bendiken

## Installation

=== "C"

    ```bash
    git clone https://github.com/dogmatists/dogma.c.git
    ```

=== "C++"

    ```bash
    git clone https://github.com/dogmatists/dogma.cpp.git
    ```

=== "Dart"

    ```
    dependencies:
      dogma: ^0.0.0
    ```

=== "Protobuf"

    ```bash
    git clone https://github.com/dogmatists/dogma.pb.git
    ```

=== "Python"

    ```bash
    pip3 install dogma.py
    ```

=== "Ruby"

    ```bash
    gem install dogma.rb
    ```

=== "Rust"

    ```rust
    cargo install dogma
    ```

=== "Zig"

    ```bash
    git clone https://github.com/dogmatists/dogma.zig.git
    ```

For more detailed instructions, see the [Installation](install.md) chapter.

## Usage

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

=== "Rust"

    ```rust
    extern crate dogma;
    ```

=== "Zig"

    ```zig
    const dogma = @import("dogma");
    ```

For more detailed instructions, see the [Getting Started](start.md) chapter.
