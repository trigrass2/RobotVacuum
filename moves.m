function rloc=moves(rloc,R)
%%function rloc=moves(rloc)
%Moves rbot to the south
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot
if R(rloc(1)-1,rloc(2))~=0
    rloc(1)=rloc(1)-1;
elseif R(rloc(1)-1,rloc(2)+1)~=0
    rloc=movese(rloc,R);
else
    rloc=movesw(rloc,R);
end