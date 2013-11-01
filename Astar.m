%Resource 1: http://en.wikipedia.org/wiki/A*
%Resource 2: http://www.policyalmanac.org/games/aStarTutorial.htm
%function path=Astar(R,current,dest)
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
%  g=ones(size(R))/eps;                                                       % Creates matrix g with values at 1/eps which is as close to infite as needed for these purposes
%  f=ones(size(R))/eps;                                                       % Creates matrix f with values at 1/eps which is as close to infite as needed for these purposes
%  g(current(1),current(2))=0;                                                % Enters the current distance traversed into g at current location.
%  f(current(1),current(2))=g(current(1),current(2))+h_estimate(current,dest);% Enters estimated total distance from current location to destination.
%  openset=current;                                                           % Adds current location to openset
%
%% Main functional loop.
%while openset is not empty
%     current=choosecurrent(openset,R)                                                                 % Chooses new current from openset based on the location in openset with the lowest f value          
%     if current == dest                                                                               % Indicates destination has been reached
%         path=reconstruct_path(came_from, current)                                                    % Reconstructs path
%         openset=[];                                                                                  % Breaks while loop 
%     else                                                                                             % Continues with neighbor analysis
%         openset=removecoord(openset,current)                                                         % remove current from openset
%         closedset=[current;closedset];                                                               % add current to closedset
%         n=neighbor_nodes(current)                                                                    % generate neigbor list for current
%         for k=1:8                                                                                    % Each location in n=neighbor_nodes(current) 
%             neighbor=[n(k,1),n(k,2)];                                                                % save coordinates for neighbor being tested
%             tentative_g=g(current(1),current(2))+weighting(neighbor,R)*dist_between(current,neighbor)% Generate tentative g to test the neighbor
%             tentative_f=tentative_g+h_estimate(neighbor,goal)                                        % Generate tentative f to test the neighbor
%             if neighbor is in closedset and tentative_f>=f(neighbor(1),neighbor(2))                  % Neighbor does not need to be checked
%                  continue
%             elseif neighbor is in openset or tentative_f_score<f_score(current)                     % If neighbor's f is lower than current, that neighbor is added to camefrom 
%                 came_from=[came_from; current];
%                 g(neighbor(1),neighbor(2))= tentative_g_score
%                 f(neighbor(n,1),neighbor(n,2))= tentative_f_score
%             else % neighbor not in openset
%                 openset=[openset; current]  %add neighbor to openset
%             end
%         end
%     end
% end
%
%% Generates a weighted value to prioritize cleaning dirty spaces while avoiding areas that have already been covered
%function w=weighting(neighbor,R)
%switch R(neighbor(1),neighbor(2))
%case 0
% w=1/eps;
%case 4
% w=9;
%case 5
% w=11;
%otherwise
% w=10;
%end
%Weights are tentative requiring testing
%% Generates hueristics for current location
%    function h=h_estimate(current,goal)
%    h=sum(abs(goal-current));
%
%% Chooses new current from openset based on the location in openset with the lowest f value
%function current=choosecurrent(openset,F)
%for k=1:length(openset)
%    fo(k)=f(openset(k,1),openset(k,2));
%    [c,i]=min(fo);
%    current=openset(i,:);
%
%% Removes a pair of coordinates from a set of coordinates
%function set=removecoord(set,coord)
%for i=1:length(set)
%    if set(i,1)==coord(1) && set(i,2)==coord(2)
%        set(i,:)=[];
%    else
%        continue
%    end
%end
%
%% Reconstructs path from the current node along the path followed
%function reconstruct_path(came_from, current_node)
%    if current_node in came_from
%        p := reconstruct_path(came_from, came_from[current_node])
%        return (p + current_node)
%    else
%        return current_node
%% Generates a list of the neighbor nodes from current location.
%function n=neighbor_nodes(current)
% n=[current(1)-1,current(2)-1;current(1)-1,current(2);current(1)-1,current(2)+1;current(1),current(2)-1;current(1),current(2)+1;current(1)+1,current(2)-1;current(1)+1,current(2);current(1)+1,current(2)+1];