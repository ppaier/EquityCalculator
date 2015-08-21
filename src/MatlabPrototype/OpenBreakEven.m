function [ values ] = OpenBreakEven( values )


HeroPos = values.HeroPos; 
VillPos = values.VillPos; 
BlindsWOHeroVillain = values.Blinds - HeroPos - VillPos;
OpenSize = values.OpenSize;
EV = values.EV;
  
VillFoldPer = (EV + (OpenSize-HeroPos)) / (((OpenSize-HeroPos)) + (BlindsWOHeroVillain + HeroPos + VillPos));


values.VillFoldPer = VillFoldPer;

end

