<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
=======

=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
%dumbbot.m
%cleans 100% of floor
%Import floor plan, save as R
%Find robot location, save as rloc
%Find charger location, save as cloc
[fstats,rloc,cloc,dirty]=fchecker(floorplan,bottype);             % status check at start, only keep floor covered count and coverable count
while fstats(1) / fstats(2) ~= 1                                  % While 100% of floor is not clean
    et=et+sum(at);
    if battery==0                                                 % If battery charge is 0
        [rloc,battery,at]=recharge(R,rloc,cloc,battery,at,ur);    % Recharge
    else                                                          % keep cleaning
        dest=ddfinder(rloc,R);
        path=Astar(R,current,dest);
        [rloc,R,ur,battery,at]=movepath(rloc,route,R,ur,battery);
    end
end
fstats=fchecker(R,1); %Run fchecker again to ensure that all of the floor has been cleaned
if fstats(1)~=fstats(2)
    run highend_the_rs_group.m
else
    [rloc,battery,at]=recharge(R,rloc,cloc,battery,at,ur);                        % return to charger
end
