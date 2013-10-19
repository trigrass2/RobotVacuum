%Runs the main sections of code

%prompts user for input and stores that file into memory
map = MapLoader(input('Input filename : ','s'));

%returns initial route
route = RoutePlanner(map);
