function [  ] = UpdateGui( handles, active, colors )
%UPDATEGUI Summary of this function goes here
%   Detailed explanation goes here

if ~isempty(active)
set(handles.EDStackSize,'Enable',active{1});
set(handles.EDVillFold,'Enable',active{2});
set(handles.EDHeroEqu,'Enable',active{3});
set(handles.EDOpenTo,'Enable',active{4});
set(handles.ED3BetTo,'Enable',active{5});
set(handles.CBAllin3Bet,'Enable',active{6});
set(handles.ED4BetTo,'Enable',active{7});
set(handles.CBAllin4Bet,'Enable',active{8});
set(handles.ED5BetTo,'Enable',active{9});
set(handles.CBAllin5Bet,'Enable',active{10});
set(handles.EDEv,'Enable',active{11});
set(handles.EDBlinds,'Enable',active{12});
end

if ~isempty(colors)
set(handles.EDStackSize,'ForegroundColor',colors{1});
set(handles.EDVillFold,'ForegroundColor',colors{2});
set(handles.EDHeroEqu,'ForegroundColor',colors{3});
set(handles.EDOpenTo,'ForegroundColor',colors{4});
set(handles.ED3BetTo,'ForegroundColor',colors{5});
set(handles.CBAllin3Bet,'ForegroundColor',colors{6});
set(handles.ED4BetTo,'ForegroundColor',colors{7});
set(handles.CBAllin4Bet,'ForegroundColor',colors{8});
set(handles.ED5BetTo,'ForegroundColor',colors{9});
set(handles.CBAllin5Bet,'ForegroundColor',colors{10});
set(handles.EDEv,'ForegroundColor',colors{11});
set(handles.EDBlinds,'ForegroundColor',colors{12});
end

end

