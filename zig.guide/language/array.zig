const std = @import("std");

const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

test "check equal lenght of arrays" {
    try std.testing.expect(a.len == b.len);
}
