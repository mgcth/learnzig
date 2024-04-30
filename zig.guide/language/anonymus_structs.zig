const std = @import("std");

test "anonymus struct literal" {
    const Point = struct { x: i32, y: i32 };

    var pt: Point = .{
        .x = 13,
        .y = 67,
    };

    try std.testing.expect(pt.x == 13);
    try std.testing.expect(pt.y == 67);
}

test "fully anonymous struct" {
    try dump(.{
        .int = @as(u32, 1234),
        .float = @as(f64, 12.34),
        .b = true,
        .s = "hi",
    });
}

fn dump(args: anytype) !void {
    try std.testing.expect(args.int == 1234);
    try std.testing.expect(args.float == 12.34);
    try std.testing.expect(args.b);
    try std.testing.expect(args.s[0] == 'h');
    try std.testing.expect(args.s[1] == 'i');
}

test "tuple" {
    const values = .{
        @as(u32, 1234),
        @as(f64, 12.34),
        true,
        "hi",
    } ++ .{false} ** 2;
    try std.testing.expect(values[0] == 1234);
    try std.testing.expect(values[4] == false);
    inline for (values, 0..) |v, i| {
        if (i != 2) continue;
        try std.testing.expect(v);
    }
    try std.testing.expect(values.len == 6);
    try std.testing.expect(values.@"3"[0] == 'h');
}
