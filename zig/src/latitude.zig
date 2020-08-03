// This is free and unencumbered software released into the public domain.

const Angle = @import("angle.zig").Angle;

/// A latitude.
///
/// See: https://dogma.dev/Latitude
pub const Latitude = extern struct {
    angle: Angle,

    const Self = @This();

    const MIN_DEGREES = -90;
    const MAX_DEGREES = 90;

    pub fn init(degrees: f64) Self {
        return Self{ .angle = Angle.fromDegrees(degrees) };
    }

    pub fn initWithBounds(degrees: f64) !Self {
        if (degrees < MIN_DEGREES) return error.Underflow;
        if (degrees > MAX_DEGREES) return error.Overflow;
        return init(degrees);
    }
};

test "Latitude" { // zig test --main-pkg-path . src/latitude.zig
    const meta = @import("std").meta;
    meta.refAllDecls(@This());
}

test "Latitude.{MIN,MAX}_DEGREES are usable" {
    const expect = @import("std").testing.expect;
    expect(Latitude.MIN_DEGREES == -90);
    expect(Latitude.MAX_DEGREES == 90);
}

test "Latitude.init(degrees) constructs the latitude from degrees" {
    const expect = @import("std").testing.expect;
    expect(Latitude.init(0).angle.degrees() == 0);
    expect(Latitude.init(-90).angle.degrees() == -90);
    expect(Latitude.init(90).angle.degrees() == 90);
}

test "Latitude.initWithBounds(degrees) where degrees > ±90° returns en error" {
    const expect = @import("std").testing.expect;
    expect((Latitude.initWithBounds(0) catch unreachable).angle.degrees() == 0);
    expect((Latitude.initWithBounds(-90) catch unreachable).angle.degrees() == -90);
    expect((Latitude.initWithBounds(90) catch unreachable).angle.degrees() == 90);
    expect((Latitude.initWithBounds(-91) catch Latitude.init(0)).angle.radians() == 0);
    expect((Latitude.initWithBounds(91) catch Latitude.init(0)).angle.radians() == 0);
}
