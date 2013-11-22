%% Removes a pair of coordinates from a set of coordinates
function set=removecoord(set,coord)
for i=1:size(set,1)
    if set(i,1)==coord(1) && set(i,2)==coord(2)
        set(i,:)=[];
<<<<<<< HEAD
<<<<<<< HEAD
        break
=======
<<<<<<< HEAD
=======
        break
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
=======
=======
        break
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
    end
end