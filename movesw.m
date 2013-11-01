function rloc=movesw(rloc,R)
%function rloc=movesw(rloc,R)
%Moves rbot to the southwest
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot

if R(rloc(1)-1,rloc(2)-1)~=0
    rloc=rloc-1;
elseif R(rloc(1)-1,rloc(2))~=0
    rloc=moves(rloc,R);
else
    rloc=movew(rloc,R);
end