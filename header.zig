pub const std = @import("std");

///Here I'm using a global struct so I can test using different globals if need be, and so it can be passed around.
///Furthermore:
/// - A function with no global arg is pure
/// - A function that takes global reads only
/// - A function that takes a ptr is global mutating.
pub const Global = struct {
    allocator: std.mem.Allocator,
    stdout: @TypeOf(std.io.getStdOut().writer()),
    stdin: @TypeOf(std.io.getStdIn().reader()),
};