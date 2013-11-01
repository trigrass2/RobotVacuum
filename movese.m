function rloc=movese(rloc,R)
%function rloc=movese(rloc,R)
%Moves rbot to the southeast
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot

if R(rloc(1)-1,rloc(2)+1)~=0
    rloc(1)=rloc(1)-1;
    rloc(2)=rloc(2)+1;
elseif R(rloc(1),rloc(2)+1)~=0
    rloc=movee(rloc,R);
else
    rloc=moves(rloc,R);
end