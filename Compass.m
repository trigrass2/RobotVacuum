function compass = Compass()
%Compass returns a listing of the cardinal directions that can be moved
%with their corresponding unit values
%Input args
%  none
%Output args
%  compass = list of cardinal directions


%sets the cardinal directions
n = [-1, 0];
ne = [-1, 1];
e = [0, 1];
se = [1, 1];
s = [1, 0];
sw = [1, -1];
w = [0, -1];
nw = [-1, -1];

%sets the entire compass
compass = [n; ne; e; se; s; sw; w; nw];



