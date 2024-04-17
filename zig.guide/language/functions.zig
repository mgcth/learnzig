const std = @import("std");

fn addFive(x: u32) u32 {
    return x + 5;
}

fn addFiveFail(x: u32) u32 {
    x += 1;
    return x;
}

test "function pass" {
    const y = addFive(0);
    try std.testing.expect(@TypeOf(y) == u32);
    try std.testing.expect(y == 5);
}

test "function fail" {
    try std.testing.expect(addFiveFail(0) == 6);
}

fn fibonacci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

test "function recursion" {
    const x = fibonacci(10);
    try std.testing.expect(x == 55);
}
