function route = RoutePlanner(map)
%RoutePlanner creates a simple route where it goes in a straight line until
%it hits a wall. Once it hits a wall, it turns slightly to the right and
%tries to continue on. If it finds that it can't turn in any direction
%except backwards, it moves back one step and tries again.
%Input args
%  map = matrix of unknown height and width
%Output args
%  route = matrix of x and y coordinates

[m,n] = size(map);
route=zeros(m*n,3);
routeSlot=1;

%Get the compass
compass = Compass();

%Set initial direction to east
dir = 3; 

%Set initial Robot location,wherever the charger is
robotLoc = [0 0];
[robotLoc(1), robotLoc(2)] = find(map==2);

%Set the first step in the route to be this charger location
route(routeSlot,1) = robotLoc(1);
route(routeSlot,2) = robotLoc(2);
route(routeSlot,3) = robotLoc(2);
routeSlot=2; %go to the next slot

%Stepping back counter
counterBackStep = 1;

%checks for remaining ground, clean or dirty; once every piece of carpet
%has been 'exlpored' it stops looking around
while ExistOnMap(map,[3 4]) == 1
    newY = robotLoc(1)+compass(dir,1);
    newX = robotLoc(2)+compass(dir,2);
    %checks if we can move to the next space in the pre-chosen direction
    if map(newY,newX) ~= 0 && map(newY,newX) ~= 5
        
        %no change in direction is needed
        
    else
        %tries to find a new direction to go that's not backwards
        newDirFound = 0;
        n = -3;
        while n <= 3 && newDirFound == 0
            newDir = dir + n ;
            if newDir < 1
                newDir = newDir+8;
            elseif newDir > 8 
                newDir = newDir-8;
            end
                newY = robotLoc(1)+compass(newDir,1);
                newX = robotLoc(2)+compass(newDir,2);
             if map(newY,newX) ~= 0 && map(newY,newX) ~= 5
                dir = newDir;
                 newDirFound=1;
             end
           n=n+1;
        end
        
        %this will be true if the only direction to go if backwards
        if n > 3 %&& counterBackStep < 5
            %sets the new location to go as previous location from route
            
            newY = route(routeSlot-counterBackStep,1);
            newX = route(routeSlot-counterBackStep,2);         
            counterBackStep = counterBackStep+2;
        %elseif counterBackStep >= 5
            
        else
            counterBackStep = 1;
            %{
            newDir = dir + n ;
            if newDir < 1
                newDir = newDir+8;
            elseif newDir > 8 
                newDir = newDir-8;
            end
            newY = loc(1)+compass(newDir,1);
            newX = loc(2)+compass(newDir,2);
            if map(newY,newX) ~= 0
                dir = newDir;
                newDirFound=1;
            end
            %}
        end
    end
    
    %stores that space's coordinates
    %y = loc(1)+compass(dir,1);
    %x = loc(2)+compass(dir,2);

    %update the route 
    [route,routeSlot] = NextStep(map,newY,newX,route,routeSlot);
    %changes state in previous space to an explored state
     map(robotLoc(1),robotLoc(2)) = 5; 

    %updates the location to the new location based on the route array
    robotLoc(1) = route(routeSlot-1,1);
    robotLoc(2) = route(routeSlot-1,2);
end

%Shorten the route matrix to just the actual route
zeroRows = any(route==0, 2);
route(zeroRows, :) = [];
route = route(:,1:2);




