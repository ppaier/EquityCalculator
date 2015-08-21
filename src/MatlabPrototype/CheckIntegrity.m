function [ ] = CheckIntegrity( handles )
%CHECKINTEGRITY Summary of this function goes here
%   Detailed explanation goes here



val_string = get(handles.EDStackSize,'String');
val_st = str2double(val_string);
if isnan(val_st) || val_st < 0
    set(handles.EDStackSize,'String','100');
end

val_string = get(handles.EDVillFold,'String');
val_vf = str2double(val_string);
if isnan(val_vf)
    set(handles.EDVillFold,'String','60');
elseif val_vf > 100
    set(handles.EDVillFold,'String','100');
elseif val_vf < 0
    set(handles.EDVillFold,'String','0');
end


val_string = get(handles.EDHeroEqu,'String');
val_he = str2double(val_string);
if isnan(val_he)
    set(handles.EDHeroEqu,'String','60');
elseif val_he > 100
    set(handles.EDHeroEqu,'String','100');
elseif val_he < 0
    set(handles.EDHeroEqu,'String','0');
end

val_string = get(handles.EDOpenTo,'String');
val_op = str2double(val_string);
if isnan(val_op) ||  val_op<2
    val_op = 2;
    set(handles.EDOpenTo,'String',num2str(val_op));
end


val_string = get(handles.ED3BetTo,'String');
val_3b = str2double(val_string);
if isnan(val_3b) || (val_3b < val_op*2-1)
    val_3b = val_op*2-1;
    set(handles.ED3BetTo,'String',num2str(val_3b));
end


val_string = get(handles.ED4BetTo,'String');
val_4b = str2double(val_string);
if isnan(val_4b) || (val_4b < (2*val_3b-val_op))
    val_4b = 2*val_3b-val_op;
    set(handles.ED4BetTo,'String',num2str((val_4b)));
end


val_string = get(handles.ED5BetTo,'String');
val_5b = str2double(val_string);
if isnan(val_5b) || (val_5b < (2*val_4b-val_3b))
    val_5b = 2*val_4b-val_3b;
    set(handles.ED5BetTo,'String',num2str(val_5b));
end

end

