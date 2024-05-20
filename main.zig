const Eng = @import("engine.zig");
const std = Eng.std;
const Global = Eng.Global;

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

    try ReadData(global, &Colors, &RRs, &Utils);
    Print(global, "Cards read in.\n", .{});

    const game_state: *Eng.GameState = try Eng.Setup_Game(global, &Colors, &RRs, &Utils);
    _ = game_state;
}

// =========================================================== FUNCTIONS ============================================================ //

/// If the function cannot print to stdout for whatever reason, return error code 74, which seems to be the std-ish error for IO failure, otherwise never err
fn Print(global: Global, comptime format: []const u8, args: anytype) void {
    global.stdout.print(format, args) catch std.os.exit(74);
}

/// Function to read in data from `properties.txt` and also partially hand fills in values
fn ReadData(global: Global, Colors: *[22]Eng.Card, RRs: *[4]Eng.Card, Utils: *[2]Eng.Card) !void {
    var file = std.fs.cwd().openFile("properties.txt", .{}) catch {
        Print(global, "Cannot open file `properties.txt`\n", .{});
        std.os.exit(1);
    };
    defer file.close();
    var file_reader = file.reader();

    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip firstline
    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip second
    var file_buffer = std.ArrayList(u8).init(global.allocator);

    for (0..22) |i| {
        Colors[i].colordata = std.mem.zeroes(Eng.ColorPropertyCard);
        Colors[i].card_type = Eng.CardType.ColorCard;

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].name_US = try file_buffer.toOwnedSlice();

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].name_UK = try file_buffer.toOwnedSlice();

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].cost = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read: {}\n", .{Colors[i].cost});

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].colordata.?.base_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read: {}\n", .{Colors[i].base_rent});

        try file_reader.skipUntilDelimiterOrEof('\t');
        //Discard color set, cuz its calculatable

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].colordata.?.h1_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read: {}\n", .{Colors[i].h1_rent});

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].colordata.?.h2_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].colordata.?.h3_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].colordata.?.h4_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].colordata.?.hotel_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].colordata.?.house_cost = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read hc: {}\n", .{Colors[i].house_cost});

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].morgage = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read mo: {}\n", .{Colors[i].morgage});

        try file_reader.skipUntilDelimiterOrEof('\n');
        Colors[i].unmorgage = Colors[i].morgage + Colors[i].morgage / 10;
        //Discard color set, cuz its calculatable

        //Print(global, "Data read: {s}\n", .{Colors[i].name_US});
    }

    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip skipline

    for (0..4) |i| {
        RRs[i].colordata = null;
        Colors[i].card_type = Eng.CardType.RailRoad;

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        RRs[i].name_US = try file_buffer.toOwnedSlice();

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        RRs[i].name_UK = try file_buffer.toOwnedSlice();

        RRs[i].cost = 200;
        RRs[i].morgage = 100;
        RRs[i].unmorgage = 110;

        try file_reader.skipUntilDelimiterOrEof('\n');
    }

    {
        const str = "Electric Company";
        var slice = try global.allocator.alloc(u8, str.len);
        for (0..str.len) |i| {
            slice[i] = str[i];
        }

        Utils[0] = Eng.Card{ .card_type = Eng.CardType.Utility, .name_US = slice, .name_UK = slice, .cost = 150, .morgage = 75, .unmorgage = 83, .colordata = null };
    }

    {
        const str = "Water Works";
        var slice = try global.allocator.alloc(u8, str.len);
        for (0..str.len) |i| {
            slice[i] = str[i];
        }

        Utils[1] = Eng.Card{ .card_type = Eng.CardType.Utility, .name_US = slice, .name_UK = slice, .cost = 150, .morgage = 75, .unmorgage = 83, .colordata = null };
    }
}



