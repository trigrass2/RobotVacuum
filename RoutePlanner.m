function route = RoutePlanner(map)
%RoutePlanner creates a very basic route S-shaped route
%ignores walls for the time being
%Input args
%  map = matrix of unknown height and width
%Output args
%  route = matrix of x and y coordinates

[m,n] = size(map);
route=zeros(m*n,3);
routeSlot=1;
for y = 1:m
    %moves from left to right on odds and left to right on evens
    if rem(y,2)~=0
        for x = 1:n
            route(routeSlot,1)=x;
            route(routeSlot,2)=y;
            route(routeSlot,3)=map(y,x);
            routeSlot=routeSlot+1;
        end
    else
        for x = n:-1:1
            route(routeSlot,1)=x;
            route(routeSlot,2)=y;
            route(routeSlot,3)=map(y,x);
            routeSlot=routeSlot+1;
        end  
    end
    
end


