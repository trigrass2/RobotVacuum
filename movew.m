function rloc=movew(rloc,R)
%function rloc=movew(rloc,R)
%Moves rbot to the west
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot
if R(rloc(1),rloc(2)-1)~=0
    rloc(2)=rloc(2)-1;
elseif R(rloc(1)-1,rloc(2)-1)~=0
    rloc=movesw(rloc,R);
else
    rloc=movenw(rloc,R);
end