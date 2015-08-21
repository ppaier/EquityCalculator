function [ values ] = Bluff4BetBreakEven( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
Size3Bet = values.Size3Bet;
Size4Bet = values.Size4Bet;
EV = values.EV;
HeroEq = values.HeroEquity;
StackSize = values.StackSize;

if values.Allin4Bet
    RestStack = StackSize - OpenSize;
    A = (HeroEq * StackSize*2 + BlindsWOHeroVillain - RestStack);
    B = (BlindsWOHeroVillain + OpenSize + Size3Bet );
    VillFoldPer = ( EV - A ) / (B - A);
else   
    VillFoldPer = (EV + (Size4Bet-OpenSize)) / ((Size4Bet-OpenSize) + (BlindsWOHeroVillain + OpenSize + Size3Bet));
end

values.VillFoldPer = VillFoldPer;

end

