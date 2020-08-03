// This is free and unencumbered software released into the public domain.

const pi = @import("std").math.pi;

/// An angle.
///
/// See: https://dogma.dev/Angle
pub const Angle = extern struct {
    /// The angle in radians.
    _radians: f64,

    const Self = @This();

    /// Constructs an angle from radians.
    pub fn init(radians: f64) Self {
        return Self{ ._radians = radians };
    }

    /// Constructs an angle from radians.
    pub fn fromRadians(radians_: f64) Self {
        return Self{ ._radians = radians_ };
    }

    /// Constructs an angle from degrees.
    pub fn fromDegrees(degrees_: f64) Self {
        return Self{ ._radians = degrees_ / 180.0 * pi };
    }

    /// Constructs an angle from turns.
    pub fn fromTurns(turns_: f64) Self {
        return Self{ ._radians = turns_ * 2 * pi };
    }

    /// The angle in radians.
    pub fn radians(self: Self) f64 {
        return self._radians;
    }

    /// The angle in degrees.
    pub fn degrees(self: Self) f64 {
        return self._radians / pi * 180.0;
    }

    /// The angle in turns.
    pub fn turns(self: Self) f64 {
        return self._radians / (2 * pi);
    }
};

test "Angle" { // zig test --main-pkg-path . src/angle.zig
    const meta = @import("std").meta;
    meta.refAllDecls(@This());
}

test "Angle.fromRadians() constructs the angle from radians" {
    const expect = @import("std").testing.expect;
    expect(Angle.fromRadians(0).radians() == 0);
    expect(Angle.fromRadians(0.5 * pi).radians() == 0.5 * pi);
    expect(Angle.fromRadians(pi).radians() == pi);
    expect(Angle.fromRadians(2 * pi).radians() == 2 * pi);
}

test "Angle.fromDegrees() constructs the angle from degrees" {
    const expect = @import("std").testing.expect;
    expect(Angle.fromDegrees(0).degrees() == 0);
    expect(Angle.fromDegrees(90).degrees() == 90);
    expect(Angle.fromDegrees(180).degrees() == 180);
    expect(Angle.fromDegrees(360).degrees() == 360);
}

test "Angle.fromTurns() constructs the angle from turns" {
    const expect = @import("std").testing.expect;
    expect(Angle.fromTurns(0).turns() == 0);
    expect(Angle.fromTurns(0.25).turns() == 0.25);
    expect(Angle.fromTurns(0.5).turns() == 0.5);
    expect(Angle.fromTurns(1).turns() == 1);
}
