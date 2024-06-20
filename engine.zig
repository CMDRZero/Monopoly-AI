pub const header = @import("header.zig");
pub const std = header.std;
pub const Global = header.Global;


pub fn ValueTypeStruct(comptime valuetype: type) type {
    return struct {
        brown: [15]valuetype,
        l_blue: [24]valuetype,
        pink: [24]valuetype,
        orange: [24]valuetype,
        red: [24]valuetype,
        green: [24]valuetype,
        rr: [14]valuetype,
        utils: [5]valuetype,
        d_blue: [15]valuetype,
        gojf: [3]valuetype,
        jail_time: [3]valuetype,
        money: [41]valuetype,
    };
}
pub const ValueStruct = ValueTypeStruct(u16);

pub const GameState = struct {
    map: [40]MapTile,
    player_states: [4]?PlayerState,
    cards: [28]OwnableCard, //22 Colors, 4 RRs, 2 Util
    gojf_owners: [2]?u2,

    community_chest: std.TailQueue(ChestCard),
    chance: std.TailQueue(ChanceCard),
};

pub const PlayerState = struct {
    id: u2, //Up to 4 players max
    money: u16, //65K is enough money
    pos: u8, //Position is 0-39, except here go to jail, is replaced with jail, cuz you can't reside on the former time, and the latter is shared with passing by
    jail_time: ?u2, //Up to 3 turns, except it can't go to 4, also its null is NA
    //Cards are managed by an owner id by the game

    fn Earn(self: PlayerState, amt: i16) void {
        self.money += amt;
        //Todo, check bankrupcy
    }
    
    fn AdvanceTo(self: PlayerState, pos: u8) void {
        if (pos < self.pos){
            self.Earn(200);
        }
        self.pos = pos;
    }
};

pub const OwnableCard = struct {
    owner: ?u2 = null,
    houses: i4 = 0,
    card: Card = undefined,

    fn FromCard(old: Card) OwnableCard {
        return OwnableCard{.owner = null, .card = old};
    }
    fn FromCardMany(new: []OwnableCard, old: []Card) []OwnableCard {
        for (old, 0..) |oldInst, i| {
            new[i] = OwnableCard{.owner = null, .card = oldInst};
        }
        return new;
    }

    pub fn CurrRent(self: *const OwnableCard) u16{
        if (self.owner == null){
            return self.card.cost;
        }
        return switch (self.card.card_type) {
            .ColorCard => |colorcard| colorcard.RentHint(self.houses),
            .Utility => 28,
            .RailRoad => 25,
        };
    }
};
pub const Card = struct {
    card_type: CompCardType,
    name_US: []u8,
    name_UK: []u8,
    cost: u16,
    morgage: u16,
    unmorgage: u16,
};

pub const ColorPropertyCard = struct {
    base_rent: u16,
    h1_rent: u16,
    h2_rent: u16,
    h3_rent: u16,
    h4_rent: u16,
    hotel_rent: u16,
    house_cost: u16,

    fn RentHint(self: *const ColorPropertyCard, houses: i4) u16 {
        return switch (houses) {
            -1 => 0,
            0 => self.base_rent,
            1 => self.h1_rent,
            2 => self.h2_rent,
            3 => self.h3_rent,
            4 => self.h4_rent,
            5 => self.hotel_rent,
            else => unreachable,
        };
    }
};

pub const CompCardType = union(CardType){
    ColorCard: ColorPropertyCard,
    RailRoad: void,
    Utility: void,
};

pub const CardType = enum {
    ColorCard,
    RailRoad,
    Utility,
};

pub const MapTile = union (enum) {
    Go: void,
    Community_Chest: void,
    Chance: void,
    Income_Tax: void,
    Luxury_Tax: void,
    Jail: void,
    Just_Visiting: void,
    Free_Parking: void,
    Purchaseable: *OwnableCard,
};

pub const jailpos = 30;

pub const ChestCard = enum {
    ATG,   // Advance to Go (Collect 200$)
    BEIF,  // Bank error in your favor. Collect $200
    DFP,   // Doctor’s fee. Pay $50
    FS50,  // From sale of stock you get $50
    GOJ,   // Get Out of Jail Free
    GTJ,   // Go to Jail. Go directly to jail, do not pass Go, do not collect $200
    HFM,   // Holiday fund matures. Receive $100
    ITR,   // Income tax refund. Collect $20
    BDC,   // It is your birthday. Collect $10 from every player
    LIM,   // Life insurance matures. Collect $100
    PHF,   // Pay hospital fees of $100
    PSF,   // Pay school fees of $50
    RCF,   // Receive $25 consultancy fee
    SR,    // You are assessed for street repair. $40 per house. $115 per hotel
    WSP,   // You have won second prize in a beauty contest. Collect $10
    I100,  // You inherit $100
};

pub const ChanceCard = enum {
    ATB,   // Advance to Boardwalk
    ATG,   // Advance to Go (Collect $200)
    AIA,   // Advance to Illinois Avenue. If you pass Go, collect $200
    ASC,   // Advance to St. Charles Place. If you pass Go, collect $200
    ARR1,  // Advance to the nearest Railroad. If unowned, you may buy it from the Bank. If owned, pay wonder twice the rental to which they are otherwise entitled (1)
    ARR2,  // Advance to the nearest Railroad. If unowned, you may buy it from the Bank. If owned, pay wonder twice the rental to which they are otherwise entitled (2)
    ATU,   // Advance token to nearest Utility. If unowned, you may buy it from the Bank. If owned, throw dice and pay owner a total ten times amount thrown
    BPD,   // Bank pays you dividend of $50
    GJF,   // Get Out of Jail Free
    GB3,   // Go Back 3 Spaces
    GTJ,   // Go to Jail. Go directly to Jail, do not pass Go, do not collect $200
    MGR,   // Make general repairs on all your property. For each house pay $25. For each hotel pay $100
    SF,    // Speeding fine $15
    TRR,   // Take a trip to Reading Railroad. If you pass Go, collect $200
    ECB,   // You have been elected Chairman of the Board. Pay each player $50
    BLM,   // Your building loan matures. Collect $150
};

pub fn Chest_Str(cardID: ChestCard) *const [:0]u8 {
    return switch (cardID) {
        .ATG => "Advance to Go (Collect 200$)",
        .BEIF => "Bank error in your favor. Collect $200",
        .DFP => "Doctor’s fee. Pay $50",
        .FS50 => "From sale of stock you get $50",
        .GOJ => "Get Out of Jail Free",
        .GTJ => "Go to Jail. Go directly to jail, do not pass Go, do not collect $200",
        .HFM => "Holiday fund matures. Receive $100",
        .ITR => "Income tax refund. Collect $20",
        .BDC => "It is your birthday. Collect $10 from every player",
        .LIM => "Life insurance matures. Collect $100",
        .PHF => "Pay hospital fees of $100",
        .PSF => "Pay school fees of $50",
        .RCF => "Receive $25 consultancy fee",
        .SR => "You are assessed for street repair. $40 per house. $115 per hotel",
        .WSP => "You have won second prize in a beauty contest. Collect $10",
        .I100 => "You inherit $100",
    };
}

pub fn Chance_Str(cardID: ChanceCard) *const [:0]u8 {
    return switch (cardID) {
        .ATB => "Advance to Boardwalk",
        .ATG => "Advance to Go (Collect $200)",
        .AIA => "Advance to Illinois Avenue. If you pass Go, collect $200",
        .ASC => "Advance to St. Charles Place. If you pass Go, collect $200",
        .ARR1 => "Advance to the nearest Railroad. If unowned, you may buy it from the Bank. If owned, pay wonder twice the rental to which they are otherwise entitled",
        .ARR2 => "Advance to the nearest Railroad. If unowned, you may buy it from the Bank. If owned, pay wonder twice the rental to which they are otherwise entitled",
        .ATU => "Advance token to nearest Utility. If unowned, you may buy it from the Bank. If owned, throw dice and pay owner a total ten times amount thrown",
        .BPD => "Bank pays you dividend of $50",
        .GJF => "Get Out of Jail Free",
        .GB3 => "Go Back 3 Spaces",
        .GTJ => "Go to Jail. Go directly to Jail, do not pass Go, do not collect $200",
        .MGR => "Make general repairs on all your property. For each house pay $25. For each hotel pay $100",
        .SF => "Speeding fine $15",
        .TRR => "Take a trip to Reading Railroad. If you pass Go, collect $200",
        .ECB => "You have been elected Chairman of the Board. Pay each player $50",
        .BLM => "Your building loan matures. Collect $150",
    };
}

pub const chance_funcs = struct {
        fn Coll200(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(200);
        }
        fn Coll150(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(150);
        }
        fn Coll50(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(50);
        }
        fn Pay50(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(-50);
        }
        fn Nada(game_state: GameState, id: u2) void{
            _ = game_state;
            _ = id;
            return;
        }
        fn GtJ(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.pos = jailpos;
        }
        fn Coll20(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(20);
        }
        fn BDay(game_state: GameState, id: u2) void{
            for (0..4) |i| {
                if(i != id and game_state.player_states[i] != null){
                    game_state.player_states[i].?.Earn(-10);
                    game_state.player_states[id].?.Earn(10);
                }
            }
        }
        fn CouncilBoard(game_state: GameState, id: u2) void{
            for (0..4) |i| {
                if(i != id and game_state.player_states[i] != null){
                    game_state.player_states[i].?.Earn(50);
                    game_state.player_states[id].?.Earn(-50);
                }
            }
        }
        fn Coll100(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(100);
        }
        fn Pay100(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(-100);
        }
        fn Pay25(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(-25);
        }
        fn Pay15(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(-15);
        }
        fn StreetRepair(game_state: GameState, id: u2) void{
            //TODO
            _ = game_state;
            _ = id;
            return;
        }
        fn GeneralRepair(game_state: GameState, id: u2) void{
            //TODO
            _ = game_state;
            _ = id;
            return;
        }
        fn Coll10(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.Earn(10);
        }
        fn ATB(game_state: GameState, id: u2) void{
            game_state.player_states[id].?.pos = 39; 
        }
        fn ATI(game_state: GameState, id: u2) void {
            game_state.player_states[id].?.AdvanceTo(24);
        }
        fn ATSC(game_state: GameState, id: u2) void {
            game_state.player_states[id].?.AdvanceTo(11);
        }
        fn ATNR(game_state: GameState, id: u2) void {
            const pos = game_state.player_states[id].?.pos;
            game_state.player_states[id].?.AdvanceTo((10 * ((pos+5) / 10)) % 40);
        }
        fn ATNU(game_state: GameState, id: u2) void {
            const pos = game_state.player_states[id].?.pos;
            if(12 < pos and pos < 28) {
                game_state.player_states[id].?.AdvanceTo(28);
            } else {
                game_state.player_states[id].?.AdvanceTo(12);
            }
        }
        fn ATRR(game_state: GameState, id: u2) void {
            game_state.player_states[id].?.AdvanceTo(5);
        }
        fn GBT(game_state: GameState, id: u2) void {
            const pos = game_state.player_states[id].?.pos;
            game_state.player_states[id].?.AdvanceTo((pos-3)%40);
        }
    };

pub fn Chest_Func(game_state: GameState, cardID: ChestCard, id: u2) void {
    return switch (cardID) {
        .ATG => chance_funcs.Coll200,
        .BEIF => chance_funcs.Coll200,
        .DFP => chance_funcs.Pay50,
        .FS50 => chance_funcs.Coll50,
        .GOJ => chance_funcs.Nada,
        .GTJ => chance_funcs.GtJ,
        .HFM => chance_funcs.Coll100,
        .ITR => chance_funcs.Coll20,
        .BDC => chance_funcs.BDay,
        .LIM => chance_funcs.Coll100,
        .PHF => chance_funcs.Pay100,
        .PSF => chance_funcs.Pay50,
        .RCF => chance_funcs.Pay25,
        .SR => chance_funcs.StreetRepair,
        .WSP => chance_funcs.Coll10,
        .I100 => chance_funcs.Coll100,
    }(game_state, id);
}

pub fn Chance_Func(game_state: GameState, cardID: ChestCard, id: u2) void {
    return switch (cardID) {
        .ATB => chance_funcs.Coll200,
        .ATG => chance_funcs.Coll200,
        .AIA => chance_funcs.ATI,
        .ASC => chance_funcs.ATSC,
        .ARR1 => chance_funcs.ATNR,
        .ARR2 => chance_funcs.ATNR,
        .ATU => chance_funcs.ATNU,
        .BPD => chance_funcs.Coll50,
        .GJF => chance_funcs.Nada,
        .GB3 => chance_funcs.GBT,
        .GTJ => chance_funcs.GtJ,
        .MGR => chance_funcs.GeneralRepair,
        .SF => chance_funcs.Pay15,
        .TRR => chance_funcs.ATRR,
        .ECB => chance_funcs.CouncilBoard,
        .BLM => chance_funcs.Coll150,
    }(game_state, id);
}

pub fn Setup_Game(global: Global, Colors: *[22]Card, RRs: *[4]Card, Utils: *[2]Card) !*GameState{

    var ret = try global.allocator.create(GameState);

    ret.* = GameState{
        .map = undefined,
        .player_states = [4] ?PlayerState {
            PlayerState{.id = 0, .jail_time = null, .money = 2_000, .pos = 0},
            PlayerState{.id = 1, .jail_time = null, .money = 2_000, .pos = 0},
            PlayerState{.id = 2, .jail_time = null, .money = 2_000, .pos = 0},
            PlayerState{.id = 3, .jail_time = null, .money = 2_000, .pos = 0},
        },
        
        .cards = undefined,
        .gojf_owners = undefined,
        .community_chest = undefined,
        .chance = undefined,
    }; 

    for (Colors, 0..) |card, i| {
        ret.cards[i] = OwnableCard.FromCard(card);
    }
    for (RRs, 0..) |card, i| {
        ret.cards[22+i] = OwnableCard.FromCard(card);
    }
    for (Utils, 0..) |card, i| {
        ret.cards[26+i] = OwnableCard.FromCard(card);
    }

    {
        ret.map[0] = .Go;
        ret.map[1] = .{.Purchaseable = &ret.cards[0]};
        ret.map[2] = .Community_Chest;
        ret.map[3] = .{.Purchaseable = &ret.cards[1]};
        ret.map[4] = .Income_Tax;
        ret.map[5] = .{.Purchaseable = &ret.cards[22]};
        ret.map[6] = .{.Purchaseable = &ret.cards[2]};
        ret.map[7] = .Go;
        ret.map[8] = .{.Purchaseable = &ret.cards[3]};
        ret.map[9] = .{.Purchaseable = &ret.cards[4]};
        ret.map[10] = .Just_Visiting;
        ret.map[11] = .{.Purchaseable = &ret.cards[5]};
        ret.map[12] = .{.Purchaseable = &ret.cards[26]};
        ret.map[13] = .{.Purchaseable = &ret.cards[6]};
        ret.map[14] = .{.Purchaseable = &ret.cards[7]};
        ret.map[15] = .{.Purchaseable = &ret.cards[23]};
        ret.map[16] = .{.Purchaseable = &ret.cards[8]};
        ret.map[17] = .Community_Chest;
        ret.map[18] = .{.Purchaseable = &ret.cards[9]};
        ret.map[19] = .{.Purchaseable = &ret.cards[10]};
        ret.map[20] = .Free_Parking;
        ret.map[21] = .{.Purchaseable = &ret.cards[11]};
        ret.map[22] = .Chance;
        ret.map[23] = .{.Purchaseable = &ret.cards[12]};
        ret.map[24] = .{.Purchaseable = &ret.cards[13]};
        ret.map[25] = .{.Purchaseable = &ret.cards[24]};
        ret.map[26] = .{.Purchaseable = &ret.cards[14]};
        ret.map[27] = .{.Purchaseable = &ret.cards[15]};
        ret.map[28] = .{.Purchaseable = &ret.cards[27]};
        ret.map[29] = .{.Purchaseable = &ret.cards[16]};
        ret.map[30] = .Jail;
        ret.map[31] = .{.Purchaseable = &ret.cards[17]};
        ret.map[32] = .{.Purchaseable = &ret.cards[18]};
        ret.map[33] = .Community_Chest;
        ret.map[34] = .{.Purchaseable = &ret.cards[19]};
        ret.map[35] = .{.Purchaseable = &ret.cards[25]};
        ret.map[36] = .Chance;
        ret.map[37] = .{.Purchaseable = &ret.cards[20]};
        ret.map[38] = .Luxury_Tax;
        ret.map[39] = .{.Purchaseable = &ret.cards[21]};
    }

    return ret;
}

pub fn Pad(comptime len: u32, str: anytype) *const[len:0]u8{
    return str ++ "\x00" ** (len-str.len);
}

pub fn TakeTurn(gamestate: GameState, id: u2) void {
    const playerstate = gamestate.player_states[id].?;
    if (playerstate.jail_time) |time| {
        _ = time;
        @panic("TODO: handle jail");
    }
}