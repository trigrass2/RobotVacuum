
%cleans 100% of floor
%Import floor plan, save as R
R=roomread('sgtest.xlsx','sheet1');
[fstats,rloc,cloc,dirty]=fchecker(R,1);                           % status check at start, only keep fstats, rloc and cloc
battery=100;
et=0;
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
if fstats(1)~=fstats(2)
    while fstats(1) / fstats(2) ~= 1                                  % While 100% of floor hasn't been cleaned
        et=et+sum(at);                                                % Adds times of last action taken to the elapsed time
        if battery==0                                                 % If battery charge is 0
            [rloc,R,ur,battery,at]=recharge(R,rloc,cloc,battery,ur);  % Recharge
        else                                                          % keep cleaning
            dest=ddfinder(rloc,R);
            route=Astar(R,rloc,dest);
            [rloc,R,ur,battery,at]=moveroute(rloc,route,R,ur,battery);
        end
    end
else
    [rloc,battery,at]=recharge(R,rloc,cloc,battery,at,ur);                        % return to charger
end
