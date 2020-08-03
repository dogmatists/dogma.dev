// This is free and unencumbered software released into the public domain.

pub usingnamespace @import("src/angle.zig");
pub usingnamespace @import("src/latitude.zig");
pub usingnamespace @import("src/longitude.zig");

test "Dogma" { // zig test dogma.zig
    const meta = @import("std").meta;
    meta.refAllDecls(@This());
}
