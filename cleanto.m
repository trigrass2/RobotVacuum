function [rloc,R]=cleanto(rloc,dest,R)
%Moves robot in a straight line to new location rloc
%Input:
% rloc: Current robot location as coordinate array
% dest: Destination as coordinate array
% R:    Sensor data map.
%Output:
% rloc: New Robot location after movement
% R:    Sensor data map.

while rloc~=dest         %While the robot has not reached its destination.
    path=dest-rloc;      %Determines number of rows and columns that must still be traversed.
    R(rloc(1),rloc(2))=3;
    if istrue(path(1)) && istrue(path(2))   %If true, robot will move on a diagonal axis.
        if abs(path(1))~=path(1) && abs(path(2))==path(2)
            rloc=movene(rloc,R);
        elseif abs(path(1))~=path(1) && abs(path(2))~=path(2)
            rloc=movenw(rloc,R);
        elseif abs(path(1))==path(1) && abs(path(2))==path(2)
            rloc=movese(rloc,R);
        else 
            rloc=movesw(rloc,R);
        end
    elseif path(1)~=0               %If true, robot will move between rows
        if abs(path(1))~=path(1)    %If path(1) is positive, the robot will move a row up.
            rloc=moven(rloc,R);
        else                        %Otherwise the robot will move a row down
            rloc=moves(rloc,R);
        end
    elseif path(2)~=0               %If neither of the above is true, the robot will move between columns
        if abs(path(2))==path(2)    %If path(2) is positive, the robot will move a column to the right.
            rloc=movee(rloc,R);
        else                        %Otherwise the robot moves a column left
            rloc=movew(rloc,R);
        end
    end
    R(rloc(1),rloc(2))=1;
end


