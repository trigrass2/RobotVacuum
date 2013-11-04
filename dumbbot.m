
%dumbbot.m
%cleans 100% of floor
%Import floor plan, save as R
%Find robot location, save as rloc
%Find charger location, save as cloc
fstats=fchecker(R,1);             % status check at start, only keep floor covered count and coverable count
while fstats(1) / fstats(2) ~= 1  % While 100% of floor is not clean
    if battery==0                 % If battery charge is 0
        [rloc,battery]=recharge(rloc,cloc,battery);        %Recharge
    else                          % keep cleaning
        dest=ddfinder(rloc,R);
        path=Astar(R,current,dest);
        %check after each movement along path, determining if cleaning has been done.
        %use cleaner if spot hasn't been cleaned yet
        %update spot that it has been covered, update floor covered percentage and battery
    end
end
fstats=fchecker(R,1); %Run fchecker again to ensure that all of the floor has been cleaned
if fstats(1)~=fstats(2)
    run dumbbot.m
else
    [rloc,battery]=recharge(rloc,battery);
end
%return to charger