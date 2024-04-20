const std = @import("std");

const Direction = enum { north, south, east, west };

const Value = enum(u2) { zero, one, two };

test "enum ordinal value" {
    try std.testing.expect(@intFromEnum(Value.zero) == 0);
    try std.testing.expect(@intFromEnum(Value.one) == 1);
    try std.testing.expect(@intFromEnum(Value.two) == 2);
}

const Value2 = enum(u32) {
    hundred = 100,
    thousand = 1000,
    million = 1000000,
    next,
};

test "set enum ordinal value" {
    try std.testing.expect(@intFromEnum(Value2.hundred) == 100);
    try std.testing.expect(@intFromEnum(Value2.thousand) == 1000);
    try std.testing.expect(@intFromEnum(Value2.million) == 1000000);
    try std.testing.expect(@intFromEnum(Value2.next) == 1000001);
}

const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,

    pub fn isClubs(self: Suit) bool {
        return self == Suit.clubs;
    }
};

test "enum method" {
    try std.testing.expect(Suit.spades.isClubs() == Suit.isClubs(.spades));
}

const Mode = enum {
    var count: u32 = 0;
    on,
    off,
};

test "hmm" {
    Mode.count += 1;
    try std.testing.expect(Mode.count == 1);
}
