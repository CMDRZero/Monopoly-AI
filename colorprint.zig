const std = @import("std");
const color = @import("color.zig");

const Global = struct {
    allocator: std.mem.Allocator,
    stdout: @TypeOf(std.io.getStdOut().writer()),
    stdin: @TypeOf(std.io.getStdIn().reader()),
};



fn Print(global: Global, comptime format: []const u8, args: anytype) void {
    global.stdout.print(format, args) catch std.os.exit(74);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();
    var pre_alloc = std.heap.GeneralPurposeAllocator(.{}){};
    const global: Global = .{
        .allocator = pre_alloc.allocator(),
        .stdout = stdout,
        .stdin = stdin,
    };

    Print(global, "Color test begin\n", .{});
    Print(global, "\x1b[38;2;255;0;0m"++"This is Red text\n", .{});
    Print(global, "\x1b[0m"++"This is normal text\n", .{});
    Print(global, color.RGBCode(255, 0, 0)++"This is done using the lib\n", .{});
}