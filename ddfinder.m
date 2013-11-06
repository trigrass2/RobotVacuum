%%Dumb Destination Finder
function [dest]=ddfinder(rloc,R)
%% I/O
%  Inputs:
%   rloc: Current location of robot
%   R: Room floorplan
%  Output:
%   Determines a destination for the dumb robots
%% Chooses a destination based on the current location of the robot

c=rnd(size(R)/2); % Finds center of room
crel=c-rloc; % Finds rows and columns between robot and the center of the room
if crel(1)>=0 && crel(2)>=0  %Quadrant= 4
    %If robot in quadrant 4, choose a destination in quadrant 1;
    for qL=size(R,1):-1:c(1)
        for qW=size(R,2):-1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
                dest=[qL,qW];
            end
        end
    end
elseif crel(1)<0 && crel(2)>=0 %Quadrant= 3
    % If robot in quadrant 3, choose a destination in quadrant 4
    for qL=1:c(1)
        for qW=size(R,2):-1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
                dest=[qL,qW];
            end
        end
    end
elseif crel(1)<0 && crel(2)<0  %Quadrand=2
    % If robot in quadrant 2, choose a destination in quadrant 3
    for qL=size(R,1):-1:c(1)
        for qW=1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
                dest=[qL,qW];
            end
        end
    end
else %Quadrant= 1
    % If robot in quadrant 1, choose a destination in quadrant 2
    for qL=1:c(1)
        for qW=1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
                dest=[qL,qW];
            end
        end
    end
end
    