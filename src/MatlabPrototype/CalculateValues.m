function [ ] = CalculateValues( handles )
%CALCULATEVALUES Summary of this function goes here
%   Detailed explanation goes here

values = GetValuesFromHandles(handles);
green = [0,0.5,0];
red = 'red';
color = green;

switch values.Program
    case 'Open (EV in BB)'
        values = OpenEV(values);
        WriteValuesToHandles(values,handles);
        if values.EV<0
            color = red;
        end
        UpdateGui(handles,[],{'black','black','black','black','black','black','black','black','black','black',color,'black'});
    case 'Open (Break Even Point)'
        values = OpenBreakEven(values);
        WriteValuesToHandles(values,handles);
        if values.VillFoldPer<0 || values.VillFoldPer>1
            color = red;
        end
        UpdateGui(handles,[],{'black',color,'black','black','black','black','black','black','black','black','black','black'});
    case 'Bluff 3 Bet (EV in BB)'
        values = Bluff3BetEV(values);
        WriteValuesToHandles(values,handles);
        if values.EV<0
            color = red;
        end
        UpdateGui(handles,[],{'black','black','black','black','black','black','black','black','black','black',color,'black'});
    case 'Bluff 3 Bet (Break Even Point)'
        values = Bluff3BetBreakEven(values);
        WriteValuesToHandles(values,handles);
        if values.VillFoldPer<0 || values.VillFoldPer>1
            color = red;
        end
        UpdateGui(handles,[],{'black',color,'black','black','black','black','black','black','black','black','black','black'});
    case 'Bluff 4 Bet (EV in BB)'
        values = Bluff4BetEV(values);
        WriteValuesToHandles(values,handles);
        if values.EV<0
            color = red;
        end
        UpdateGui(handles,[],{'black','black','black','black','black','black','black','black','black','black',color,'black'});
    case 'Bluff 4 Bet (Break Even Point)'
        values = Bluff4BetBreakEven(values);
        WriteValuesToHandles(values,handles);
        if values.VillFoldPer<0 || values.VillFoldPer>1
            color = red;
        end
        UpdateGui(handles,[],{'black',color,'black','black','black','black','black','black','black','black','black','black'});
    case 'Bluff 5 Bet (EV in BB)'
        values = Bluff5BetEV(values);
        WriteValuesToHandles(values,handles);
        if values.EV<0
            color = red;
        end
        UpdateGui(handles,[],{'black','black','black','black','black','black','black','black','black','black',color,'black'});
    case 'Bluff 5 Bet (Break Even Point)'
        values = Bluff5BetBreakEven(values);
        WriteValuesToHandles(values,handles);
        if values.VillFoldPer<0 || values.VillFoldPer>1
            color = red;
        end
        UpdateGui(handles,[],{'black',color,'black','black','black','black','black','black','black','black','black','black'});
end



end

