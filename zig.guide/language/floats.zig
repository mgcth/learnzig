const std = @import("std");

test "float widening" {
    const a: f16 = 0;
    const b: f32 = a;
    const c: f128 = b;
    try std.testing.expect(c == @as(f128, a));
}

test "int-float conversion" {
    const a: i32 = 0;
    const b = @as(f32, @floatFromInt(a));
    const c = @as(i32, @intFromFloat(b));
    try std.testing.expect(c == a);
}
