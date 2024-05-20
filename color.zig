const std = @import("std");

pub inline fn RGBCode(comptime red: u8, comptime green: u8, comptime blue: u8) []u8 {
    var buf: [32]u8 = undefined;
    return try std.fmt.bufPrint(&buf, "\x1b[38;2;{};{};{}m", .{red, green, blue});
}