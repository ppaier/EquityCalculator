function [ values ] = Bluff5BetEV( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
Size3Bet = values.Size3Bet;
Size4Bet = values.Size4Bet;
Size5Bet = values.Size5Bet;
VillFoldPer = values.VillFoldPer;
HeroEq = values.HeroEquity;
StackSize = values.StackSize;

if values.Allin5Bet
    RestStack = StackSize - Size3Bet;
    EV = (1 - VillFoldPer) * (HeroEq*2*StackSize + BlindsWOHeroVillain - RestStack) + VillFoldPer * (Size4Bet+Size3Bet+BlindsWOHeroVillain) ;
else
    EV = ((Size4Bet + Size3Bet + BlindsWOHeroVillain) * VillFoldPer) -( (Size5Bet-Size3Bet) * (1-VillFoldPer));
end
values.EV = EV;

end

