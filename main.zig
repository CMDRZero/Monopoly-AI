const std = @import("std");

const Global = struct {
    allocator: std.mem.Allocator,
    stdout: @TypeOf(std.io.getStdOut().writer()),
    stdin: @TypeOf(std.io.getStdIn().reader()),
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();
    var pre_alloc = std.heap.GeneralPurposeAllocator(.{}){};
    const global: Global = .{ 
        .allocator = pre_alloc.allocator(), 
        .stdout = stdout, 
        .stdin = stdin, 
    };

    _ = global;
    //Here I'm using a global struct so I can test using different globals if need be, and so it can be passed around.
    //Furthermore: 
    // - A function with no global arg is pure
    // - A function that takes global reads only
    // - A function that takes a ptr is global mutating.


}