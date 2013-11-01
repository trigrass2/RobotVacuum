function rloc=moven(rloc,R)
%%function rloc=moven(rloc,R)
%Moves rbot to the north
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot
if R(rloc(1)-1,rloc(2))~=0
    rloc(1)=rloc(1)-1;
elseif R(rloc(1)-1,rloc(2)-1)~=0
    rloc=movenw(rloc,R);
else
    rloc=movene(rloc,R);
end