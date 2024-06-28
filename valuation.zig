const Eng = @import("engine.zig");
const std = Eng.std;
const Global = Eng.Global;

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
        money: [101]valuetype,
        cascade: [3]valuetype,
    };
}
pub const ValueStruct = ValueTypeStruct(u16);

pub fn CalcIndex(numOwned: u3, numHouses: u4) u5 {
    const baseInd = (numOwned + 1)*(numOwned + 2)/2 - 1;
    const trueInd = baseInd + numHouses;
    return trueInd;
}

pub fn ValueColor(gamestate: Eng.GameState, id: u2, color: Eng.CardColor, values: []u16) u16 {
    const numOwned = Eng.NumOwned(gamestate, id, .ColorCard, color);
    const numHouses = Eng.NumHousesInColor(gamestate, id, .ColorCard, color);
    return values[CalcIndex(numOwned, numHouses)];
}