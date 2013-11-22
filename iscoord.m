<<<<<<< HEAD
=======
<<<<<<< HEAD
%% Determines if coordinates is in a set of coordinates
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
function yn=iscoord(set,coord)
% Inputs:
% set: 2 column matrix containing coordinates of rows and columns, in that order.
% coord: Coordinates to be checked against the set.
% Outputs:
% yn: returns a 1 of the coordinates are present in the set and a 0 if the coordinates are not

<<<<<<< HEAD
=======
<<<<<<< HEAD
for l=1:size(set,1)
    if set(l,1)==coord(1) && set(l,2)==coord(2)
=======
>>>>>>> origin/complete-code
if isempty(set)|| exist('set','var')==0
    yn=0;
    return
end
for k=1:size(set,1)
    if set(k,1)==coord(1) && set(k,2)==coord(2)
<<<<<<< HEAD
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
        yn=1;
    else
        yn=0;
    end
end