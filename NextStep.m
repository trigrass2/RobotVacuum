function [route,routeSlot] = NextStep(map,y,x,route,routeSlot)
%NextStep stores the next step in the route of the robot
%Input args
%  map = copy of the map being used
%  y = the next y coordinate
%  x = the next x coordinate
%  route = the route for the robot
%  routeSlot = the current slot number for the next step
%Output args
%  route = matrix of x and y coordinates

route(routeSlot,1)=y;
route(routeSlot,2)=x;
route(routeSlot,3)=map(y,x);
routeSlot=routeSlot+1;

