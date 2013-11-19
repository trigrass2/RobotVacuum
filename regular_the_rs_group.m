
%dumbbot.m
%cleans 100% of floor
%Import floor plan, save as R
%Find robot location, save as rloc
%Find charger location, save as cloc
[fstats,rloc,cloc,dirty]=fchecker(floorplan,bottype);             % status check at start, only keep floor covered count and coverable count
while fstats(1) / fstats(2) ~= 1                                  % While 100% of floor is not clean
    et=et+sum(at);
    if battery==0                                                 % If battery charge is 0
        [rloc,R,ur,battery,at]=recharge(R,rloc,cloc,battery,ur);    % Recharge
    else                                                          % keep cleaning
        dest=ddfinder(rloc,R);
        path=Astar(R,current,dest);
        [rloc,R,ur,battery,at]=movepath(rloc,route,R,ur,battery);
    end
end
fstats=fchecker(R,1); %Run fchecker again to ensure that all of the floor has been cleaned
if fstats(1)~=fstats(2)
    run regular_the_rs_group.m
else
    [rloc,R,ur,battery,at]=recharge(R,rloc,cloc,battery,ur);                        % return to charger
end
