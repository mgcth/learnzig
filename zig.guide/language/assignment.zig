const std = @import("std");
const expect = std.testing.expect;

const constant: i32 = 5;
var variable: u32 = 5000;

const inferred_constant = @as(i32, 5);
var inferred_variable = @as(u32, 5000);

const a: i32 = undefined;
const b: u32 = undefined;

test "constants equal" {
    try expect(constant == inferred_constant);
}

test "variables equal" {
    try expect(variable == inferred_variable);
}

// all tests below should fail
test "undefined variable fail" {
    try expect(a == b);
}

test "undefined variable and undefined fail" {
    try expect(a == undefined);
}

test "undefined variable and undefined coercion fail" {
    try expect(a == @as(i32, undefined));
}

test "same undefined variable fail" {
    try expect(a == a);
}
