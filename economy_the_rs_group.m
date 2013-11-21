
%cleans 100% of floor
%Import floor plan, save as R
R=roomread('sgtest.xlsx','sheet1');                               % Will need to change to input prompt
[fstats,rloc,cloc,~]=fchecker(R,1);                               % Status check at start, only keep fstats, rloc and cloc
if exist('battery')==0 %#ok<*EXIST>
    battery=100;                                                  % Sets initial battery charge, if one does not yet exist
end
if exist('et')==0
    et=0;                                                         % Sets initial elapsed time, if one does not yet exist
end
while fstats(1) / fstats(2) ~= 1                                  % While 100% of floor hasn't been cleaned
    if battery==0                                                 % If battery charge is 0
        [rloc,R,ur,battery,at]=recharge(R,rloc,cloc,battery,ur);  % Recharge
    else                                                          % keep cleaning
        dest=ddfinder(rloc,R);
        route=Astar(R,rloc,dest);
        [rloc,R,ur,battery,at]=moveroute(rloc,route,R,ur,battery);
    end
    et=et+sum(at);                                               % Adds times of last action taken to the elapsed time
end
fstats=fchecker(R,1); %Run fchecker again to ensure that all of the floor has been cleaned
[rloc,battery,at]=recharge(R,rloc,cloc,battery,at,ur);                        % return to charger
