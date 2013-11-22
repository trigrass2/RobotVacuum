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
<<<<<<< HEAD
=======
<<<<<<< HEAD
%  closedset:  The set of locations already evaluated.
%  g: matrix of g values at each node
%  f: matrix of f values at each node
=======
>>>>>>> origin/complete-code
%  Columns of coordinates
%  Column 1: row
%  Column 2: column
%  Column 3: g: distance travelled, weighted
%  Column 4: h: estimated distance remaining
%  Column 5: f=g+h
%  closedset:  The set of locations already evaluated.
<<<<<<< HEAD
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
%  openset:    The set of tentative locations to be evaluated, initially containing only the start node
%  came_from:  The map of navigated nodes.
%  current: the node in openset having the lowest f value
%
%% Generate initial g, f and openset.                                                                          
<<<<<<< HEAD
=======
<<<<<<< HEAD
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
=======
>>>>>>> origin/complete-code
current(3)=0; current(4)=h_estimate(current,dest); current(5)=current(3)+current(4);
openset=current;                                                                                       % Adds current location to openset
n=current;
closedset=[];
came_from=[]; 
route=[];

%% Main functional loop.                                                                                
while isempty(route)                                                                                   % until a route is generated
     [current,came_from]=choosecurrent(current,openset,came_from,n);                                     % Chooses new current from openset based on the location in openset with the lowest f value          
     if current(1)==dest(1) && current(2)==dest(2)                                                     % Indicates destination has been reached
<<<<<<< HEAD
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
         route=reconstruct_route(came_from);                                                           % Reconstructs route
         openset=[];                                                                                   % Breaks while loop 
     else                                                                                              % Continues with neighbor analysis
         openset=removecoord(openset,current);                                                         % remove current from openset
         closedset=[current;closedset];                                                   %#ok<*AGROW> % add current to closedset
<<<<<<< HEAD
=======
<<<<<<< HEAD
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
=======
>>>>>>> origin/complete-code
         n=neighbor_nodes(current,R,dest);                                                           % generate neigbor list for current
         for p=1:size(n,1)
             if iscoord(closedset,n(p,1:2)) && n(p,5)>current(5)
             elseif iscoord(closedset,n(p,1:2))==0 && iscoord(openset,n(p,1:2))==0
                 openset=[openset;n(p,:)];
             else
<<<<<<< HEAD
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
             end
         end
     end
 end
<<<<<<< HEAD
=======
<<<<<<< HEAD
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
=======
>>>>>>> origin/complete-code

function w=weighting(neighbor,R) % Generates a weighted value to prioritize cleaning dirty spaces while avoiding areas that have already been covered
switch R(neighbor(1),neighbor(2))
    case 0
        w=.1/eps;
    case 3
        w=.9;
    case 5
        w=1.2;
    otherwise
       w=1.0;
end
%Weights are tentative pending testing

function route=reconstruct_route(came_from) % Reconstructs the route that the robot will take to its destination.
<<<<<<< HEAD
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
% Inputs: 
%  cf: list of coordinates that were used to get to the destination
% Output:
%  route: reconstructed route containing the direction that the robot will move.
<<<<<<< HEAD
=======
<<<<<<< HEAD
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
=======
>>>>>>> origin/complete-code
for k=1:length(came_from)-1
    route(k)=came_from(k)-came_from(k+1);
end

function [n]=neighbor_nodes(current,R,dest) % Generates a list of the neighbor nodes from current location.
n=[current(1)-1,current(2)-1;current(1)-1,current(2);current(1)-1,current(2)+1;current(1),current(2)-1;current(1),current(2)+1;current(1)+1,current(2)-1;current(1)+1,current(2);current(1)+1,current(2)+1];
n1=n;
for k=1:size(n,1)
    if R(n(k,1),n(k,2))==0
        n1=removecoord(n1,[n(k,1),n(k,2)]);
    end
end
n=n1;
for k=1:size(n,1)                                                                             % Each location in n=neighbor_nodes(current)
    n(k,3)=current(3)+1*weighting([n(k,1),n(k,2)],R);
    n(k,4)=h_estimate([n(k,1),n(k,2)],dest);
    n(k,5)=n(k,3)+n(k,4);
end
    
function h=h_estimate(current,dest) % Generates hueristics for current location
h=sum(abs(dest-current(1:2)));

function [current,came_from]=choosecurrent(current,openset,came_from,n)     %Chooses new current from openset based on the location in openset with the lowest f value
[~,in]=min(n(:,5));

if iscoord(openset,n(in,1:2))
    if iscoord(came_from,current)==0
        came_from=[came_from;current];
    end
    current=n(in,:);
else
    n=removecoord(n,n(in,1:2));
    [current,came_from]=choosecurrent(current,openset,came_from,n);
end
<<<<<<< HEAD
    
=======
    
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
