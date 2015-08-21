function [ values ] = Bluff5BetBreakEven( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
Size3Bet = values.Size3Bet;
Size4Bet = values.Size4Bet;
Size5Bet = values.Size5Bet;
EV = values.EV;
HeroEq = values.HeroEquity;
StackSize = values.StackSize;

if values.Allin5Bet
    RestStack = StackSize - Size3Bet;
    A = (HeroEq*2*StackSize + BlindsWOHeroVillain - RestStack);
    B = (Size4Bet+Size3Bet+BlindsWOHeroVillain);
    VillFoldPer = ( EV - A ) / (B - A);
else   
    A = (Size4Bet + Size3Bet + BlindsWOHeroVillain);
    B = (Size5Bet-Size3Bet);
    VillFoldPer = ( EV + B ) / (B + A);
end

values.VillFoldPer = VillFoldPer;

end

