%Runs the main sections of code

%Constants
BatteryLife = 250;
Smart = false;


%prompts user for input and stores that file into memory
%mapReadOnly should not be written to, instead it should only be read
mapReadOnly = MapLoader(input('Input filename : ','s'));

%makes a copy of the map, so that original isn't messed up
map = mapReadOnly;

%returns initial route
route = RoutePlanner(map);

%creates video of path
[frames, fps] = Mover(route,map);

%Display movie of what the robot did
movie2avi(frames,'MyMovie.avi','fps',30,'compression','None');


