%Resource 1: http://en.wikipedia.org/wiki/A*
%Resource 2: http://www.policyalmanac.org/games/aStarTutorial.htm
function path=Astar(R,current,dest)
%% Inputs: 
%  R: Map of room
%  current: current location of robot
%  dest:  destination of robot
%
%% Outputs:
%  path: list of locations
%
%% Internalized Variables:
%  closedset:  The set of locations already evaluated.
%  g: matrix of g values at each node
%  f: matrix of f values at each node
%  openset:    The set of tentative locations to be evaluated, initially containing only the start node
%  came_from:  The map of navigated nodes.
%  current: the node in openset having the lowest f value
%
%% Generate initial g, f and openset.
g=ones(size(R))/eps;                                                       % Creates matrix g with values at 1/eps which is as close to infite as needed for these purposes
f=ones(size(R))/eps;                                                       % Creates matrix f with values at 1/eps which is as close to infite as needed for these purposes
g(current(1),current(2))=0;                                                % Enters the current distance traversed into g at current location.
f(current(1),current(2))=g(current(1),current(2))+h_estimate(current,dest);% Enters estimated total distance from current location to destination.
openset=current;                                                           % Adds current location to openset

%% Main functional loop.
while isempty(openset)==0                                                                              % openset is not empty
     current=choosecurrent(openset,R);                                                                 % Chooses new current from openset based on the location in openset with the lowest f value          
     if current == dest                                                                                % Indicates destination has been reached
         path=reconstruct_path(came_from, current);                                                    % Reconstructs path
         openset=[];                                                                                   % Breaks while loop 
     else                                                                                              % Continues with neighbor analysis
         openset=removecoord(openset,current);                                                         % remove current from openset
         closedset=[current;closedset];                                                   %#ok<*AGROW> % add current to closedset
         n=neighbor_nodes(current);                                                                     % generate neigbor list for current
         for k=1:8                                                                                     % Each location in n=neighbor_nodes(current) 
             neighbor=[n(k,1),n(k,2)];                                                                 % save coordinates for neighbor being tested
             tentative_g=g(current(1),current(2))+weighting(neighbor,R)*dist_between(current,neighbor);% Generate tentative g to test the neighbor
             tentative_f=tentative_g+h_estimate(neighbor,goal);                                        % Generate tentative f to test the neighbor
             if 1==iscoord(closedset,neighbor) && tentative_f>=f(neighbor(1),neighbor(2))              % Neighbor does not need to be checked
                  continue
            elseif 1==iscoord(openset,neighbor)|| tentative_f_score<f_score(current)                   % If neighbor's f is lower than current, that neighbor is added to camefrom 
                 came_from=[came_from; current];
                 g(neighbor(1),neighbor(2))= tentative_g_score;
                 f(neighbor(n,1),neighbor(n,2))= tentative_f_score;
            else                                                                                      % neighbor not in openset
                 openset=[openset; current];                                                          % add neighbor to openset
             end
         end
     end
 end
