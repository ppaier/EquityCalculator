function [ ] = WriteValuesToHandles( values, handles )
%WRITEVALUESTOHANDLES Summary of this function goes here
%   Detailed explanation goes here



set(handles.EDStackSize,'String',values.StackSize);
set(handles.EDBlinds,'String',values.Blinds);

set(handles.EDOpenTo,'String',values.OpenSize);
set(handles.ED3BetTo,'String',values.Size3Bet);
set(handles.ED4BetTo,'String',values.Size4Bet);
set(handles.ED5BetTo,'String',values.Size5Bet);
set(handles.EDVillFold,'String',values.VillFoldPer*100);
set(handles.EDHeroEqu,'String',values.HeroEquity*100);
set(handles.EDEv,'String',values.EV);



end

