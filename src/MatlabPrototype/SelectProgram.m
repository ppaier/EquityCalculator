function [  ] = SelectProgram( handles )
%SELECTPROGRAM Summary of this function goes here
%   Detailed explanation goes here


program_val = get(handles.PMProgram,'Value');
program_strings = get(handles.PMProgram,'String');
values.Program = program_strings{program_val};
green = [0,0.5,0];

switch values.Program
    case 'Open (EV in BB)'
        en_flags = {'off','on','off','on','off','off','off','off','off','off','inactive','off'};
        colors = {'black','black','black','black','black','black','black','black','black','black',green,'black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'UTG','MP','CO','BU','SB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'MP','CO','BU','SB','BB'});
        setappdata(handles.PMHeroPos,'CurDir',1);
        setappdata(handles.PMVillPos,'CurDir',-1);
    case 'Open (Break Even Point)'
        en_flags = {'off','inactive','off','on','off','off','off','off','off','off','on','off'};        
        colors = {'black',green,'black','black','black','black','black','black','black','black','black','black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'UTG','MP','CO','BU','SB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'MP','CO','BU','SB','BB'});
        setappdata(handles.PMHeroPos,'CurDir',1);
        setappdata(handles.PMVillPos,'CurDir',-1);
    case 'Bluff 3 Bet (EV in BB)'
        en_flags = {'off','on','off','on','on','on','off','off','off','off','inactive','off'};
        colors = {'black','black','black','black','black','black','black','black','black','black',green,'black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'MP','CO','BU','SB','BB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'UTG','MP','CO','BU','SB'});
        setappdata(handles.PMHeroPos,'CurDir',-1);
        setappdata(handles.PMVillPos,'CurDir',1);
    case 'Bluff 3 Bet (Break Even Point)'
        en_flags = {'off','inactive','off','on','on','on','off','off','off','off','on','off'};     
        colors = {'black',green,'black','black','black','black','black','black','black','black','black','black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'MP','CO','BU','SB','BB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'UTG','MP','CO','BU','SB'});
        setappdata(handles.PMHeroPos,'CurDir',-1);
        setappdata(handles.PMVillPos,'CurDir',1);
    case 'Bluff 4 Bet (EV in BB)'
        en_flags = {'off','on','off','on','on','off','on','on','off','off','inactive','off'};
        colors = {'black','black','black','black','black','black','black','black','black','black',green,'black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'UTG','MP','CO','BU','SB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'MP','CO','BU','SB','BB'});
        setappdata(handles.PMHeroPos,'CurDir',1);
        setappdata(handles.PMVillPos,'CurDir',-1);
    case 'Bluff 4 Bet (Break Even Point)'
        en_flags = {'off','inactive','off','on','on','off','on','on','off','off','on','off'};
        colors = {'black',green,'black','black','black','black','black','black','black','black','black','black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'UTG','MP','CO','BU','SB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'MP','CO','BU','SB','BB'});
        setappdata(handles.PMHeroPos,'CurDir',1);
        setappdata(handles.PMVillPos,'CurDir',-1);
    case 'Bluff 5 Bet (EV in BB)'
        en_flags = {'off','on','off','on','on','off','on','off','on','on','inactive','off'};
        colors = {'black','black','black','black','black','black','black','black','black','black',green,'black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'MP','CO','BU','SB','BB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'UTG','MP','CO','BU','SB'});
        setappdata(handles.PMHeroPos,'CurDir',-1);
        setappdata(handles.PMVillPos,'CurDir',1);
    case 'Bluff 5 Bet (Break Even Point)'
        en_flags = {'off','inactive','off','on','on','off','on','off','on','on','on','off'};
        colors = {'black',green,'black','black','black','black','black','black','black','black','black','black'};
        set(handles.PMHeroPos,'Value',1);
        set(handles.PMHeroPos,'String',{'MP','CO','BU','SB','BB'});
        set(handles.PMVillPos,'Value',1);
        set(handles.PMVillPos,'String',{'UTG','MP','CO','BU','SB'});
        setappdata(handles.PMHeroPos,'CurDir',-1);
        setappdata(handles.PMVillPos,'CurDir',1);
end
    UpdateGui(handles,en_flags,colors);
end

