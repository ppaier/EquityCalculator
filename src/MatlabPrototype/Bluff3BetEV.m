function [ values ] = Bluff3BetEV( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
Size3Bet = values.Size3Bet;
VillFoldPer = values.VillFoldPer;
HeroEq = values.HeroEquity;
StackSize = values.StackSize;

if values.Allin3Bet
    RestStack = StackSize - HeroPos;
    A = HeroEq*StackSize*2 + BlindsWOHeroVillain - RestStack;
    B = BlindsWOHeroVillain + OpenSize + VillPos + HeroPos;
    EV = (1-VillFoldPer) *  A + VillFoldPer * B;
else
    EV = ((BlindsWOHeroVillain + OpenSize + HeroPos) * VillFoldPer) -( (Size3Bet-HeroPos) * (1-VillFoldPer));
end
values.EV = EV;

end

