const Eng = @import("engine.zig");
const std = Eng.std;
const Global = Eng.Global;

/// Function to read in data from `properties.txt` and also partially hand fills in values
pub fn ReadData(global: Global, Colors: *[22]Eng.Card, RRs: *[4]Eng.Card, Utils: *[2]Eng.Card) !void {
    var file = try std.fs.cwd().openFile("properties.txt", .{});
    defer file.close();
    var file_reader = file.reader();

    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip firstline
    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip second
    var file_buffer = std.ArrayList(u8).init(global.allocator);

    for (0..22) |i| {
        var colordata = std.mem.zeroes(Eng.ColorPropertyCard);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].name_US = try file_buffer.toOwnedSlice();

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].name_UK = try file_buffer.toOwnedSlice();

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].cost = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read: {}\n", .{Colors[i].cost});

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        colordata.base_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read: {}\n", .{Colors[i].base_rent});

        try file_reader.skipUntilDelimiterOrEof('\t');
        //Discard color set, cuz its calculatable

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        colordata.h1_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read: {}\n", .{Colors[i].h1_rent});

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        colordata.h2_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        colordata.h3_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        colordata.h4_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        colordata.hotel_rent = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        colordata.house_cost = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read hc: {}\n", .{Colors[i].house_cost});

        try file_reader.streamUntilDelimiter(file_buffer.writer(), '\t', null);
        Colors[i].morgage = try std.fmt.parseInt(u16, try file_buffer.toOwnedSlice(), 10);
        //Print(global, "Data read mo: {}\n", .{Colors[i].morgage});

        try file_reader.skipUntilDelimiterOrEof('\n');
        Colors[i].unmorgage = Colors[i].morgage + Colors[i].morgage / 10;
        //Discard color set, cuz its calculatable

        //Print(global, "Data read: {s}\n", .{Colors[i].name_US});

        Colors[i].card_type = Eng.CompCardType{.ColorCard = colordata};
    }

    try file_reader.skipUntilDelimiterOrEof('\n'); //Skip skipline

    for (0..4) |i| {
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

        Utils[0] = Eng.Card{ .card_type = Eng.CardType.Utility, .name_US = slice, .name_UK = slice, .cost = 150, .morgage = 75, .unmorgage = 83};
    }

    {
        const str = "Water Works";
        var slice = try global.allocator.alloc(u8, str.len);
        for (0..str.len) |i| {
            slice[i] = str[i];
        }

        Utils[1] = Eng.Card{ .card_type = Eng.CardType.Utility, .name_US = slice, .name_UK = slice, .cost = 150, .morgage = 75, .unmorgage = 83};
    }
}



