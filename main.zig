const Eng = @import("engine.zig");
const std = Eng.std;
const Global = Eng.Global;
const colorlib = @import("color.zig");
const setup = @import("setup.zig");
const Color = colorlib.Color;

const playerColors = struct {
    const A: Color = .{.red = 255, .green = 50, .blue = 50};
    const B: Color = .{.red = 50, .green = 50, .blue = 255};
    const C: Color = .{.red = 50, .green = 255, .blue = 50};
    const D: Color = .{.red = 200, .green = 50, .blue = 200};
};

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
    ColorPrint(global, .{.red = 200, .green = 50, .blue = 200}, "Color Test Alternate\n", .{});

    const game_state: *Eng.GameState = try Eng.Setup_Game(global, &Colors, &RRs, &Utils);
    //_ = game_state;

    Print(global, "New game initialized\n", .{});

    //game_state.map[1].Purchaseable.owner = 0;

    ClearScreen(global);
    DisplayState(global, game_state.*);
}

// =========================================================== FUNCTIONS ============================================================ //


fn DisplayState(global: Global, gamestate: Eng.GameState, ) void {
    Print(global, "Player        Property       Owner Price   Status\n", .{});
    for (0..40) |tilepos| {
        const tile: Eng.MapTile = gamestate.map[tilepos];
        var buf: [96] u8 = undefined;
        switch (tile) {
            inline .Go, .Community_Chest, .Chance, .Income_Tax, .Luxury_Tax, .Jail, .Just_Visiting, .Free_Parking =>
                Print(global, "({s})  {s: ^21}\n", .{ColorPlayersAt(&buf,gamestate, @intCast(tilepos)), @tagName(tile)}),
            .Purchaseable => |card| {
                // var owner: u8 = ' ';
                // if (card.owner) |val| {owner = "ABCD"[val];}
                var colbuf: [64]u8 = undefined;
                Print(global, "({s})  {s: ^21}  ({s})  {d: ^5}  {s: ^8}\n", 
                    .{ColorPlayersAt(&buf, gamestate, @intCast(tilepos)), card.card.name_US, ColorPlayers(&colbuf, card.owner), card.CurrRent(), FmtHouses(card.houses)});
                },
        }
    }
}

fn FmtHouses(num: i4) [] const u8 {
    return switch (num) {
        -1 => "Morgaged",
        0 => "0 Houses",
        1 => "1 House",
        2 => "2 Houses",
        3 => "3 Houses",
        4 => "4 Houses",
        5 => "Hotel",
        else => unreachable,
    };
}

fn PlayersAt(gamestate: Eng.GameState, pos: u8) [4]u8 {
    var ret: [4]u8 = ([1]u8{' '})**4;
    for (0..4) |id| {
        if (gamestate.player_states[id]) |player| {
            if (player.pos == pos){
                ret[id] = "ABCD"[id];
            }
        }
    }
    return ret;
}

// fn ColorPlayersAt(gamestate: Eng.GameState, pos: u8) []u8 {
//     const oldAt = PlayersAt(gamestate, pos);
//     var buf: [96] u8 = undefined;
//     return std.fmt.bufPrint(&buf, "{s}{c}{s}{c}{s}{c}{s}{c}{s}",.{
//         colorlib.RGBForeCode(playerColors.A.red, playerColors.A.green, playerColors.A.blue),
//         oldAt[0],
//         colorlib.RGBForeCode(playerColors.B.red, playerColors.B.green, playerColors.B.blue),
//         oldAt[1],
//         colorlib.RGBForeCode(playerColors.C.red, playerColors.C.green, playerColors.C.blue),
//         oldAt[2],
//         colorlib.RGBForeCode(playerColors.D.red, playerColors.D.green, playerColors.D.blue),
//         oldAt[3],
//         colorlib.RGBForeCode(255,255,255),
//     }) catch unreachable;

//     //return std.fmt.bufPrint(&buf, "{s}{s}{s}{s}", .{Colorize(playerColors.A, "{c}", .{oldAt[0]})})
// }

fn ColorPlayersAt(inbuf: *[96]u8, gamestate: Eng.GameState, pos: u8) []u8 {
    const oldAt = PlayersAt(gamestate, pos);
    return std.fmt.bufPrint(inbuf, "{s}{c}{s}{c}{s}{c}{s}{c}{s}",.{
        colorlib.RGBForeCode(playerColors.A.red, playerColors.A.green, playerColors.A.blue),
        oldAt[0],
        colorlib.RGBForeCode(playerColors.B.red, playerColors.B.green, playerColors.B.blue),
        oldAt[1],
        colorlib.RGBForeCode(playerColors.C.red, playerColors.C.green, playerColors.C.blue),
        oldAt[2],
        colorlib.RGBForeCode(playerColors.D.red, playerColors.D.green, playerColors.D.blue),
        oldAt[3],
        colorlib.RGBForeCode(255,255,255),
    }) catch @panic("Color Buffer Overflow");
}

fn ColorPlayers(inbuf: *[64]u8, player: ?u2) []u8 {
    if (player) |id| {
        const col = switch(id){
            0 => playerColors.A,
            1 => playerColors.B,
            2 => playerColors.C,
            3 => playerColors.D,
        };
        return std.fmt.bufPrint(inbuf, "{s}{c}{s}",.{
                colorlib.RunRGBForeCodeColor(col),
                "ABCD"[id],
                colorlib.RGBForeCode(255,255,255),
            }) catch @panic("Color Buffer Overflow");
    } else {
        return @constCast(&[_]u8{' '});
    }
    
}

/// If the function cannot print to stdout for whatever reason, return error code 74, which seems to be the std-ish error for IO failure, otherwise never err
fn Print(global: Global, comptime format: []const u8, args: anytype) void {
    global.stdout.print(format, args) catch std.posix.exit(74);
}

fn ColorPrint(global: Global, comptime color: Color, comptime format: []const u8, args: anytype) void {
    global.stdout.print(
        colorlib.RGBForeCode(color.red, color.green, color.blue) 
            ++ format
            ++ colorlib.RGBForeCode(255,255,255), 
        args) catch std.posix.exit(74);
}

fn ClearScreen(global: Global) void {
    Print(global, "\x1b[2J\x1b[H", .{});
}