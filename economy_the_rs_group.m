
%cleans 100% of floor
%Import floor plan, save as R
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> origin/complete-code
R=roomread('sgtest.xlsx','sheet1');
[fstats,rloc,cloc,dirty]=fchecker(R,1);                           % status check at start, only keep fstats, rloc and cloc
battery=100;
et=0;
=======
<<<<<<< HEAD
>>>>>>> origin/complete-code
=======
>>>>>>> origin/complete-code
R=roomread('sgtest.xlsx','sheet1');                               % Will need to change to input prompt
[fstats,rloc,cloc,~]=fchecker(R,1);                               % Status check at start, only keep fstats, rloc and cloc
if exist('battery')==0 %#ok<*EXIST>
    battery=100;                                                  % Sets initial battery charge, if one does not yet exist
end
if exist('et')==0
    et=0;                                                         % Sets initial elapsed time, if one does not yet exist
end
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
=======
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
>>>>>>> origin/complete-code
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
<<<<<<< HEAD
<<<<<<< HEAD
[rloc,battery,at]=recharge(R,rloc,cloc,battery,at,ur);                        % return to charger
=======
<<<<<<< HEAD
=======
>>>>>>> origin/complete-code
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
=======
[rloc,battery,at]=recharge(R,rloc,cloc,battery,at,ur);                        % return to charger
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
<<<<<<< HEAD
>>>>>>> origin/complete-code
=======
>>>>>>> origin/complete-code
