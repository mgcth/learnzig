const std = @import("std");
const expect = std.testing.expect;

test "always suceeds" {
    try expect(true);
}
