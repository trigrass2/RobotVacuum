function [frames,fps] = Mover(route, map) 
%mover moves the robot along the path and returns a series of images
% Input Args
%    route = 3 column and undefined row length listing of x, y, floorstate
%    map = a map of variable size
% Output Args
%   frames = 

%determine the length of the route
[routeLength,n] = size(route);

%frames = 1:routeLength*30;
%intializes the frames
frames(1:routeLength) = struct(getframe);


%instatiating a temporary variable to store what was at a location
lastStepCache = [0 0 0];

for step = 1:1:routeLength
    
    %this prevents weirdness from happening for the first pass
    if step ~= 1
        %replace dirt with clean floor
        if lastStepCache(3) == 3
            map(lastStepCache(1),lastStepCache(2)) = 4;
        else
        %otherwise replace what was previously overwritten on the map    
         map(lastStepCache(1),lastStepCache(2)) = lastStepCache(3);
            
        end
        
        %
        map(lastStepCache(1),lastStepCache(2)) = 5;
    end
    
    %figure out where the robot should be on the current step
    robotYLocation = route(step,1);
    robotXLocation = route(step,2);
    
    %store what's currently there so we can put it back later
    lastStepCache(1) = robotYLocation;
    lastStepCache(2) = robotXLocation;
    lastStepCache(3) = map(robotYLocation,robotXLocation);
    
    %put the robot in that location
    map(robotYLocation,robotXLocation) = 1;
    
    [frames,fps] = GetFrames(map,frames,step); 
end

