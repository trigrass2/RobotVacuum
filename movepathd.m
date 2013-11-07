function [rloc,R,ur,battery,at]=movepathd(rloc,route,R,ur,battery)
%Moves robot along path generated by Astar.m
%Input:
% rloc: Current robot location as coordinate array
% path: path generated by Astar.m
% R:    Sensor data map.
% ur:   Saves whether the spot under the robot is clean, dirty, or a
%          charger
% et: elapsed time
%Output:
% rloc: New Robot location after movement
% R:    Sensor data map.
% ur:   Saves whether the spot under the robot is clean, dirty, or a
%        charger
% et: elapsed time
%preallocate the elapsed time
at=zeros([length(route)+1, 1]);
if ur==4 || ur==3  %If location has not been cleaned
    ur=5;
    at(1)=3;
end

%For length of path,
for k=1:length(route)
    R(rloc(1),rloc(2))=ur;
    rloc=rloc+route(k,:);
    if R(rloc(1),rloc(2))~=5 && battery~=0  %Line will be different for smart robots and dumb robots
        ur=5;
        at(k+1)=3;
    else
        ur=R(rloc(1),rloc(2));
        R(rloc(1),rloc(2))=1;
        at(k+1)=1;
    end
end