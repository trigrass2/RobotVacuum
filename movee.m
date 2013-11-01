function rloc=movee(rloc,R)
%%function rloc=movee(rloc,R)
%Moves rbot to the east
%Input:
% rloc=old location array of the robot
%Output:
% rloc=new location array of robot
if R(rloc(1),rloc(2)+1)~=0
    rloc(2)=rloc(2)+1;
elseif R(rloc(1)-1,rloc(2)+1)~=0
    rloc=movene(rloc,R);
else
    rloc=movese(rloc,R);
end