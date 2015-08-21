function [ values ] = Bluff4BetEV( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
Size3Bet = values.Size3Bet;
Size4Bet = values.Size4Bet;
VillFoldPer = values.VillFoldPer;
HeroEq = values.HeroEquity;
StackSize = values.StackSize;

if values.Allin4Bet
    RestStack = StackSize  - OpenSize;
    EV = (1 - VillFoldPer) * (HeroEq * StackSize*2 + BlindsWOHeroVillain - RestStack) + VillFoldPer * (BlindsWOHeroVillain + OpenSize + Size3Bet ) ;
else
    EV = ((BlindsWOHeroVillain + OpenSize + Size3Bet) * VillFoldPer) -( (Size4Bet-OpenSize) * (1-VillFoldPer));
end
values.EV = EV;

end

