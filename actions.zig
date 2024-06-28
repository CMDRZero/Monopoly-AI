const Eng = @import("engine.zig");
const std = Eng.std;
const Global = Eng.Global;

pub const Action = union (enum) {
    BuyHouse: struct {id: u8},
    SellHouse: struct {id: u8},
};

pub fn GenerateValidActions(allocator: std.mem.Allocator, gamestate: Eng.GameState, id: u2) !std.ArrayList(Action) {
    var acts = std.ArrayList(Action).init(allocator);

    const playerstate = gamestate.player_states[id].?;
    for (0..28, gamestate.cards) |pos, ownableCard| {
        if (ownableCard.owner == id) {
            const cardtype = ownableCard.card.card_type;
            const color = if(cardtype == .ColorCard) {ownableCard.card.card_type.ColorCard.color;} else {null;};
            const houses = ownableCard.houses;
            const minHouses = Eng.MinHouses(gamestate, cardtype, color);
            const maxHouses = Eng.MaxHouses(gamestate, cardtype, color);
            
            if (playerstate.money >= ownableCard.house_cost and houses == minHouses){
                try acts.addOne(.{.BuyHouse = .{.id = pos}});
            }
            if (houses == maxHouses){
                try acts.addOne(.{.SellHouse = .{.id = pos}});
            }
        }
    }
}