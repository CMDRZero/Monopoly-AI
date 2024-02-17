const std = @import("std");

///Here I'm using a global struct so I can test using different globals if need be, and so it can be passed around.
///Furthermore: 
/// - A function with no global arg is pure
/// - A function that takes global reads only
/// - A function that takes a ptr is global mutating.
const Global = struct {
    allocator: std.mem.Allocator,
    stdout: @TypeOf(std.io.getStdOut().writer()),
    stdin: @TypeOf(std.io.getStdIn().reader()),
};

fn ValueTypeStruct(comptime valuetype: type) type {
    return struct {
        brown: [15] valuetype,
        l_blue: [24] valuetype,
        pink: [24] valuetype,
        orange: [24] valuetype,
        red: [24] valuetype,
        green: [24] valuetype,
        rr: [14] valuetype,
        utils: [5] valuetype,
        d_blue: [15] valuetype,
        money: [101] valuetype,
        gojf: [3] valuetype,
        jail_time: [3] valuetype,
    };
}

const ValueStruct = ValueTypeStruct(u16);

const Card = struct {
    name_US: []u8,
    name_UK: []u8,
    cost: u16,
    morgage: u16,
    unmorgage: u16,
    colordata: ?ColorPropertyCard,
};
const ColorPropertyCard = struct {
    base_rent: u16,
    h1_rent: u16,
    h2_rent: u16,
    h3_rent: u16,
    h4_rent: u16,
    hotel_rent: u16,
    house_cost: u16,
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

    Print(global,"Main started, IO is running\n", .{});

    var Colors: [22] Card = undefined;
    var RRs: [4] Card = undefined;
    var Utils: [2] Card = undefined;


    var file = std.fs.cwd().openFile("properties.txt",.{}) catch {Print(global, "Cannot open file `properties.txt`\n", .{}); std.os.exit(1);};
    defer file.close();
    var file_reader = file.reader();

    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip firstline
    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip second
    var file_buffer = std.ArrayList(u8).init(global.allocator);

    for (0..22) |i| {
        Colors[i].colordata = std.mem.zeroes(ColorPropertyCard);

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

        Utils[0] = Card {
        .name_US = slice,
        .name_UK = slice,
        .cost = 150,
        .morgage = 75,
        .unmorgage = 83,
        .colordata = null};
    }

    {
        const str = "Water Works";
        var slice = try global.allocator.alloc(u8, str.len);
        for (0..str.len) |i| {
            slice[i] = str[i];
        }

        Utils[1] = Card {
        .name_US = slice,
        .name_UK = slice,
        .cost = 150,
        .morgage = 75,
        .unmorgage = 83,
        .colordata = null};
    }

    Print(global,"Cards read in.\n",.{});
    

}

/// If the function cannot print to stdout for whatever reason, return error code 74, which seems to be the std-ish error for IO failure, otherwise never err
fn Print(global: Global, comptime format: []const u8, args: anytype) void {
    global.stdout.print(format, args) catch std.os.exit(74);
}
