function rloc=movenw(rloc,R)
%function rloc=movenw(rloc,R)
%Moves rbot to the northwest
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot

if R(rloc(1)-1,rloc(2)-1)~=0
    rloc(1)=rloc(1)-1;
    rloc(2)=rloc(2)-1;
elseif R(rloc(1),rloc(2)-1)~=0
    rloc=movew(rloc,R);
else
    rloc=moven(rloc,R);
end