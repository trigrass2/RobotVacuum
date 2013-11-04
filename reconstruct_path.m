function path=reconstruct_path(came_from, current)
% Reconstructs the path that the robot will take to its destination.
% Inputs: 
% came_from: list of coordinates that were used to get to the destination
if 1==iscoord(came_from,current)
    path=(p + current_node);
else
    current
end