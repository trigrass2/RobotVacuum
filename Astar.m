%Resource 1: http://en.wikipedia.org/wiki/A*
%Resource 2: http://www.policyalmanac.org/games/aStarTutorial.htm
function route=Astar(R,current,dest)
%% Inputs: 
%  R: Map of room
%  current: current location of robot
%  dest:  destination of robot
%
%% Outputs:
%  route: list of locations
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
g=ones(size(R))/eps;                                                                                   % Creates matrix g with values at 1/eps which is as close to infite as needed for these purposes
f=ones(size(R))/eps;                                                                                   % Creates matrix f with values at 1/eps which is as close to infite as needed for these purposes
g(current(1),current(2))=0;                                                                            % Enters the current distance traversed into g at current location.
f(current(1),current(2))=g(current(1),current(2))+h_estimate(current,dest);                            % Enters estimated total distance from current location to destination.
openset=current;                                                                                       % Adds current location to openset
closedset=[];                                                                                                       
%% Main functional loop.                                                                                
while isempty(openset)==0                                                                              % openset is not empty
     current=choosecurrent(openset,R);                                                                 % Chooses new current from openset based on the location in openset with the lowest f value          
     if current == dest                                                                                % Indicates destination has been reached
         route=reconstruct_route(came_from);                                                           % Reconstructs route
         openset=[];                                                                                   % Breaks while loop 
     else                                                                                              % Continues with neighbor analysis
         openset=removecoord(openset,current);                                                         % remove current from openset
         closedset=[current;closedset];                                                   %#ok<*AGROW> % add current to closedset
         n=neighbor_nodes(current);                                                                    % generate neigbor list for current
         for k=1:8                                                                                     % Each location in n=neighbor_nodes(current) 
             neighbor=[n(k,1),n(k,2)];                                                                 % save coordinates for neighbor being tested
             tentative_g=g(current(1),current(2))*weighting(neighbor,R);                               % Generate tentative g to test the neighbor
             tentative_f=tentative_g+h_estimate(neighbor,dest);                                        % Generate tentative f to test the neighbor
             if 1==iscoord(closedset,neighbor) && tentative_f>=f(neighbor(1),neighbor(2))              % Neighbor does not need to be checked
                  continue                                                                              
             elseif 1==iscoord(openset,neighbor)|| tentative_f_score<f_score(current)                  % If neighbor's f is lower than current, that neighbor is added to camefrom 
                  came_from=[came_from; current];                                                        
                  g(neighbor(1),neighbor(2))= tentative_g_score;                                         
                  f(neighbor(n,1),neighbor(n,2))= tentative_f_score;                                     
             elseif 0==iscoord(openset,neighbor)                                                       % Neighbor not in openset.
                 openset=[openset; current];                                                           % add neighbor to openset
             else                                                                                      % No route availailable
                 route=[];
             end
         end
     end
 end
%% Generates a weighted value to prioritize cleaning dirty spaces while avoiding areas that have already been covered
function w=weighting(neighbor,R)
switch R(neighbor(1),neighbor(2))
case 0
 w=1/eps;
case 4
 w=9;
case 5
 w=11;
otherwise
 w=10;
end
%Weights are tentative pending testing
%% Reconstructs the route that the robot will take to its destination.
function route=reconstruct_route(cf)
% Inputs: 
%  cf: list of coordinates that were used to get to the destination
% Output:
%  route: reconstructed route containing the direction that the robot will move.
for k=1:length(cf)-1
    route(k)=cf(k)-cf(k+1);
end
%% Generates a list of the neighbor nodes from current location.
function [n]=neighbor_nodes(current)
n=[current(1)-1,current(2)-1;current(1)-1,current(2);current(1)-1,current(2)+1;current(1),current(2)-1;current(1),current(2)+1;current(1)+1,current(2)-1;current(1)+1,current(2);current(1)+1,current(2)+1];
%
%% Generates hueristics for current location
function h=h_estimate(current,dest)
h=sum(abs(dest-current));
%% Chooses new current from openset based on the location in openset with the lowest f value
function current=choosecurrent(openset,F)
for k=1:size(openset,1)
    fopenset(k)=F(openset(k,1),openset(k,2)); %#ok<AGROW>
end
[~,i]=min(fopenset);
current=openset(i,:);