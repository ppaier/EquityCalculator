function [ values ] = Bluff3BetBreakEven( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
Size3Bet = values.Size3Bet;
EV = values.EV;
HeroEq = values.HeroEquity;
StackSize = values.StackSize;

if values.Allin3Bet
    RestStack = StackSize - HeroPos;
    A = HeroEq * StackSize*2 + BlindsWOHeroVillain - RestStack;
    B = BlindsWOHeroVillain + OpenSize + VillPos + HeroPos;
    VillFoldPer = ( EV - A ) / (B - A);
else   
    A = (BlindsWOHeroVillain + OpenSize + HeroPos);
    B = (Size3Bet-HeroPos);
    VillFoldPer = ( EV + B ) / (B + A);
end

values.VillFoldPer = VillFoldPer;

end

