function [ values ] = GetValuesFromHandles( handles )
%GETVALUESFROMHANDLES Summary of this function goes here
%   Detailed explanation goes here

program_val = get(handles.PMProgram,'Value');
program_strings = get(handles.PMProgram,'String');
values.Program = program_strings{program_val};

values.HeroPos = 0;
hero_pos_val = get(handles.PMHeroPos,'Value');
hero_pos_strings = get(handles.PMHeroPos,'String');
hero_pos = hero_pos_strings{hero_pos_val};
if strcmp(hero_pos, 'SB')
    values.HeroPos = 0.5;
elseif strcmp(hero_pos, 'BB')
    values.HeroPos = 1;
end

values.VillPos = 0;
vill_pos_val = get(handles.PMVillPos,'Value');
vill_pos_strings = get(handles.PMVillPos,'String');
vill_pos = vill_pos_strings{vill_pos_val};
if strcmp(vill_pos, 'SB')
    values.VillPos = 0.5;
elseif strcmp(vill_pos, 'BB')
    values.VillPos = 1;
end

values.StackSize = str2double(get(handles.EDStackSize,'String'));
values.Blinds = str2double(get(handles.EDBlinds,'String'));
values.OpenSize = str2double(get(handles.EDOpenTo,'String'));
values.Size3Bet = str2double(get(handles.ED3BetTo,'String'));
values.Size4Bet = str2double(get(handles.ED4BetTo,'String'));
values.Size5Bet = str2double(get(handles.ED5BetTo,'String'));
values.VillFoldPer = str2double(get(handles.EDVillFold,'String'))/100;
values.HeroEquity = str2double(get(handles.EDHeroEqu,'String'))/100;
values.EV = str2double(get(handles.EDEv,'String'));

values.Allin3Bet = get(handles.CBAllin3Bet,'Value');
values.Allin4Bet = get(handles.CBAllin4Bet,'Value');
values.Allin5Bet = get(handles.CBAllin5Bet,'Value');

end

