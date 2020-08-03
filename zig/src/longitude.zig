// This is free and unencumbered software released into the public domain.

const Angle = @import("angle.zig").Angle;

/// A longitude.
///
/// See: https://dogma.dev/Longitude
pub const Longitude = extern struct {
    angle: Angle,

    const Self = @This();

    const MIN_DEGREES = -180;
    const MAX_DEGREES = 180;

    pub fn init(degrees: f64) Self {
        return Self{ .angle = Angle.fromDegrees(degrees) };
    }

    pub fn initWithBounds(degrees: f64) !Self {
        if (degrees < MIN_DEGREES) return error.Underflow;
        if (degrees > MAX_DEGREES) return error.Overflow;
        return init(degrees);
    }
};

test "Longitude" { // zig test --main-pkg-path . src/longitude.zig
    const meta = @import("std").meta;
    meta.refAllDecls(@This());
}

test "Longitude.{MIN,MAX}_DEGREES are usable" {
    const expect = @import("std").testing.expect;
    expect(Longitude.MIN_DEGREES == -180);
    expect(Longitude.MAX_DEGREES == 180);
}

test "Longitude.init(degrees) constructs the longitude from degrees" {
    const expect = @import("std").testing.expect;
    expect(Longitude.init(0).angle.degrees() == 0);
    expect(Longitude.init(-90).angle.degrees() == -90);
    expect(Longitude.init(90).angle.degrees() == 90);
}

test "Longitude.initWithBounds(degrees) where degrees > ±180° returns en error" {
    const expect = @import("std").testing.expect;
    expect((Longitude.initWithBounds(0) catch unreachable).angle.degrees() == 0);
    expect((Longitude.initWithBounds(-180) catch unreachable).angle.degrees() == -180);
    expect((Longitude.initWithBounds(180) catch unreachable).angle.degrees() == 180);
    expect((Longitude.initWithBounds(-181) catch Longitude.init(0)).angle.radians() == 0);
    expect((Longitude.initWithBounds(181) catch Longitude.init(0)).angle.radians() == 0);
}
