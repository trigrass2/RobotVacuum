%% Determines if coordinates is in a set of coordinates
function yn=iscoord(set,coord)
% Inputs:
% set: 2 column matrix containing coordinates of rows and columns, in that order.
% coord: Coordinates to be checked against the set.
% Outputs:
% yn: returns a 1 of the coordinates are present in the set and a 0 if the coordinates are not

for l=1:size(set,1)
    if set(l,1)==coord(1) && set(l,2)==coord(2)
        yn=1;
    else
        yn=0;
    end
end