function rloc=movene(rloc,R)
%function rloc=movene(rloc,R)
%Moves rbot to the northeast
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot
if R(rloc(1)-1,rloc(2)+1)~=0
    rloc(1)=rloc(1)-1;
    rloc(2)=rloc(2)+1;
elseif R(rloc(1)-1,rloc(2))~=0
    rloc=moven(rloc,R);
else
    rloc=movee(rloc,R);
end