%% Removes a pair of coordinates from a set of coordinates
function set=removecoord(set,coord)
for i=1:size(set,1)
    if set(i,1)==coord(1) && set(i,2)==coord(2)
        set(i,:)=[];
        break
    end
end