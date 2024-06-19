const Eng = @import("engine.zig");
const std = Eng.std;
const Global = Eng.Global;
const colorlib = @import("color.zig");
const setup = @import("setup.zig");
const Color = colorlib.Color;

const mapwidth = 109;
const mapheight = 49;

// =========================================================== TYPES ============================================================ //

// =========================================================== MAIN ============================================================ //

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();
    var pre_alloc = std.heap.GeneralPurposeAllocator(.{}){};
    const global: Global = .{
        .allocator = pre_alloc.allocator(),
        .stdout = stdout,
        .stdin = stdin,
    };

    Print(global, "Main started, IO is running\n", .{});

    var Colors: [22]Eng.Card = undefined;
    var RRs: [4]Eng.Card = undefined;
    var Utils: [2]Eng.Card = undefined;

    try setup.ReadData(global, &Colors, &RRs, &Utils);
    Print(global, "Cards read in.\n", .{});
    colorlib.RGBEnable();
    Print(global, "Color Test {s}R{s}G{s}B{s}\n", .{colorlib.RGBForeCode(255,0,0), colorlib.RGBForeCode(0,255,0), colorlib.RGBForeCode(0,0,255), colorlib.RGBForeCode(255,255,255), });

    const game_state: *Eng.GameState = try Eng.Setup_Game(global, &Colors, &RRs, &Utils);
    _ = game_state;

    Print(global, "New game initialized\n", .{});

    var Map: [mapheight][mapwidth] setup.char = undefined;
    try setup.ReadMap(mapheight, mapwidth, &Map);
    try DisplayMap(global, Map);
    //Print(global, "test character {c}", .{220});
}

// =========================================================== FUNCTIONS ============================================================ //

fn DisplayMap(global: Global, map: [mapheight][mapwidth] setup.char) !void {
    for (0..mapheight) |row| {
        for (0..mapwidth) |col| {
            const sym = map[row][col];
            if (sym == .thin){
                try global.stdout.writeByte(sym.thin);
            } else {
                try global.stdout.print("{}", .{std.unicode.fmtUtf8(&sym.wide)});
            }
        }
        Print(global, "\n", .{});
    }
}


/// If the function cannot print to stdout for whatever reason, return error code 74, which seems to be the std-ish error for IO failure, otherwise never err
fn Print(global: Global, comptime format: []const u8, args: anytype) void {
    global.stdout.print(format, args) catch std.posix.exit(74);
}

fn ColorPrint(global: Global, color: Color, comptime format: []const u8, args: anytype) void {
    global.stdout.print(
        colorlib.RGBForeCode(color.red, color.green, color.blue) 
            ++ format
            ++ colorlib.RGBForeCode(255,255,255), 
        args) catch std.posix.exit(74);
}

