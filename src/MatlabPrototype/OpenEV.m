function [ values ] = OpenEV( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
VillFoldPer = values.VillFoldPer;

EV = ((BlindsWOHeroVillain + HeroPos + VillPos) * VillFoldPer) -( (OpenSize-HeroPos) * (1-VillFoldPer));
values.EV = EV;

end

