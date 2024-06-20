const std = @import("std");
const win32 = @import("win32.zig");

pub const Color = struct {red: u8, blue: u8, green: u8};

pub inline fn RGBForeCode(comptime red: u8, comptime green: u8, comptime blue: u8) []u8 {
    var buf: [32]u8 = undefined;
    return std.fmt.bufPrint(&buf, "\x1b[38;2;{};{};{}m", .{red, green, blue}) catch unreachable;
}

pub inline fn RGBBackCode(comptime red: u8, comptime green: u8, comptime blue: u8) []u8 {
    var buf: [32]u8 = undefined;
    return std.fmt.bufPrint(&buf, "\x1b[48;2;{};{};{}m", .{red, green, blue}) catch unreachable;
}

pub inline fn RGBForeCodeColor(comptime color: Color) []u8 {
    return RGBForeCode(color.red, color.green, color.blue);
}

pub inline fn RGBBackCodeColor(comptime color: Color) []u8 {
    return RGBBackCode(color.red, color.green, color.blue);
}

pub inline fn RunRGBForeCode(red: u8, green: u8, blue: u8) []u8 {
    var buf: [32]u8 = undefined;
    return std.fmt.bufPrint(&buf, "\x1b[38;2;{};{};{}m", .{red, green, blue}) catch unreachable;
}

pub inline fn RunRGBBackCode(red: u8, green: u8, blue: u8) []u8 {
    var buf: [32]u8 = undefined;
    return std.fmt.bufPrint(&buf, "\x1b[48;2;{};{};{}m", .{red, green, blue}) catch unreachable;
}

pub inline fn RunRGBForeCodeColor(color: Color) []u8 {
    return RunRGBForeCode(color.red, color.green, color.blue);
}

pub inline fn RunRGBBackCodeColor(color: Color) []u8 {
    return RunRGBBackCode(color.red, color.green, color.blue);
}

pub fn RGBEnable() void {
    //var hInput = win32.system.console.GetStdHandle(win32.system.console.STD_INPUT_HANDLE);
    const hOutput = win32.system.console.GetStdHandle(win32.system.console.STD_OUTPUT_HANDLE);
    var dwMode: win32.system.console.CONSOLE_MODE = undefined;
    _ = win32.system.console.GetConsoleMode(hOutput, &dwMode);
    dwMode = @bitCast(@as(u32, @bitCast(dwMode)) 
        | @as(u32, @bitCast(win32.system.console.ENABLE_VIRTUAL_TERMINAL_PROCESSING)) 
        | @as(u32, @bitCast(win32.system.console.ENABLE_PROCESSED_OUTPUT)));
    _ = win32.system.console.SetConsoleMode(hOutput, dwMode);
}