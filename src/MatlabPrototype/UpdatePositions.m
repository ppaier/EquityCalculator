function [  ] = UpdatePositions( handleMaster,handleSlave )
%UPDATEPOSITIONS Summary of this function goes here
%   Detailed explanation goes here


dir = getappdata(handleMaster,'CurDir');

all_positions = {'UTG','MP','CO','BU','SB','BB'};

val = get(handleMaster,'Value');
positions = get(handleMaster,'String');
position = positions{val};
cur_position = repmat({position},1,6);
idx = cellfun(@strcmp,all_positions,cur_position);
idx = find(idx>0);


if (dir>0)
    poss_vals = [idx+1:6];
else
    poss_vals = [1:1:idx-1];
end
val = get(handleSlave,'Value');
vil_positions = get(handleSlave,'String');
vil_position = vil_positions{val};

vil_positions = all_positions(poss_vals);
cur_position = repmat({vil_position},1,length(poss_vals));
idx = cellfun(@strcmp,vil_positions,cur_position);
idx = find(idx>0);
if isempty(idx)
    idx=1;
end
set(handleSlave,'Value', idx);
set(handleSlave,'String',vil_positions);

end

