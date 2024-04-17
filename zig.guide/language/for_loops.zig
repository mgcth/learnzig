const std = @import("std");

test "for" {
    const string = [_]u8{ 'a', 'b', 'c' };

    for (string, 0..) |charracter, index| {
        _ = charracter;
        _ = index;
    }

    for (string) |character| {
        _ = character;
    }

    for (string, 0..) |_, index| {
        _ = index;
    }

    for (string) |_| {}
}
