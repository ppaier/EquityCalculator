
clear all;

% 0, 0.5 oder 1
HeroPos = 0.5; 
VillPos = 0; 


Blinds = 1.5 - HeroPos - VillPos;

OpenSize = 3; % Minimum 2
Vill3Bet = 10; % Mininmum OpenSize

StackSize = 100;


Hero4BetStart = 2 * Vill3Bet - OpenSize;
Hero4BetEnd = StackSize;
Hero4BetIncrease = 1;
Hero4Bets = [Hero4BetStart:Hero4BetIncrease:Hero4BetEnd];
% zwischen 0-1
VillFoldPer = 0.3;

EVs = [];
for Hero4Bet=Hero4Bets
    EV = ((Blinds + OpenSize + Vill3Bet) * VillFoldPer) -( (Hero4Bet-OpenSize) * (1-VillFoldPer));
    EVs = [EVs,EV];
end


