%%Dumb Destination Finder
function [dest]=ddfinder(rloc,R)
%% I/O
%  Inputs:
%   rloc: Current location of robot
%   R: Room floorplan
%  Output:
%   Determines a destination for the dumb robots
%% Chooses a destination based on the current location of the robot
c=size(R)/2;
c(1)=round(c(1)); % Finds center of room
c(2)=round(c(2));
<<<<<<< HEAD
crel=c-rloc; % Finds rows and columns between robot and the center of the room
if crel(1)>=0 && crel(2)>=0  %Quadrant= 4
    %If robot in quadrant 4, choose a destination in quadrant 1;
    for qL=size(R,1):-1:c(1)
        for qW=size(R,2):-1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
=======
crel=rloc-c; % Finds rows and columns between robot and the center of the room
dest=[];
if crel(1)<0 && crel(2)<0  %Quadrant= 2
    %If robot in quadrant 2, choose a destination in quadrant 3;
    for qL=size(R,1)-1:-1:c(1)
        for qW=2:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2 && isempty(dest)
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
                dest=[qL,qW];
            end
        end
    end
<<<<<<< HEAD
elseif crel(1)<0 && crel(2)>=0 %Quadrant= 3
    % If robot in quadrant 3, choose a destination in quadrant 4
    for qL=1:c(1)
        for qW=size(R,2):-1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
=======
elseif crel(1)>=0 && crel(2)<0 %Quadrant= 3
    % If robot in quadrant 3, choose a destination in quadrant 4
    for qL=size(R,1)-1:-1:c(1)
        for qW=size(R,2)-1:-1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2 && isempty(dest)
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
                dest=[qL,qW];
            end
        end
    end
<<<<<<< HEAD
elseif crel(1)<0 && crel(2)<0  %Quadrand=2
    % If robot in quadrant 2, choose a destination in quadrant 3
    for qL=size(R,1):-1:c(1)
        for qW=1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
=======
elseif crel(1)>=0 && crel(2)>=0  %Quadrand=4
    % If robot in quadrant 4, choose a destination in quadrant 1
    for qL=2:c(1)
        for qW=size(R,2)-1:-1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2 && isempty(dest)
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
                dest=[qL,qW];
            end
        end
    end
else %Quadrant= 1
    % If robot in quadrant 1, choose a destination in quadrant 2
<<<<<<< HEAD
    for qL=1:c(1)
        for qW=1:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2
=======
    for qL=2:c(1)
        for qW=2:c(2)
            if R(qL,qW)~=0 && R(qL,qW)~=5 && R(qL,qW)~=1 && R(qL,qW)~=2 && isempty(dest)
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
                dest=[qL,qW];
            end
        end
    end
end
<<<<<<< HEAD
    
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
