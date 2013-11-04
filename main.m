%Runs the main sections of code

%prompts user for input and stores that file into memory
%mapReadOnly should not be written to, instead it should only be read
mapReadOnly = MapLoader(input('Input filename : ','s'));

%makes a copy of the map, so that original isn't messed up
routeMap = mapReadOnly;

%returns initial route
route = RoutePlanner(routeMap);
