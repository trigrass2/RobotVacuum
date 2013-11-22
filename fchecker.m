function [fstats,rloc,cloc,dirty]=fchecker(floorplan,bottype)
%  Checks floorplan and outputs 2 of the necessary arrays that the robots will use 
%% inputs:
%  floorplan: floorplan
%  bottype: 1 for dumb, or 2 for smart
%  * Assumes starting location of robot and charger are already clean
%% Output: 
%  fstats: 2 part array with the statistics the robot will need.
%  fstats(1): the number of spaces that have been cleaned, values depending on bottype
%  fstats(2): the number of spaces that the robot is able to move to
%  dirty: an array that the smartbot can use to find the nearest dirty spot on the floor.
%% For checks all values on the floorplan and determines the values needed for fstats and dirty.
fstats=[0 0];
dirty=[0 0];
if bottype==1  %if dumbot
    for L=1:size(floorplan,1) %for all rows
        for W=1:size(floorplan,2) % and all columns
            if floorplan(L,W)==5 || floorplan(L,W)==1 || floorplan(L,W)==2 %If the robot has already cleaned there, or is there currently, or if the charger is there
                fstats(1)=fstats(1)+1;  %Add one to the number of spaces that do not need to be cleaned
            end
            if floorplan(L,W)~=0        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                fstats(2)=fstats(2)+1;  %Adds one to the number of spaces that the robot could potentially clean
            end
<<<<<<< HEAD
            if floorplan(L,W)~=1        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                rloc=[L W];             %Saves robot location
            end
            if floorplan(L,W)~=2        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                cloc=[L W];             %Saves charger location
            end
            
=======
            if floorplan(L,W)==1        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                rloc=[L W];             %Saves robot location
            end
            if floorplan(L,W)==2        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                cloc=[L W];             %Saves charger location
            end            
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
        end
    end
else %if smartbot
    for L=1:size(floorplan,1) %for all rows
        for W=1:size(floorplan,2) % and all columns
            if floorplan(L,W)==3 || floorplan(L,W)==1 || floorplan ==2 %If the space is already clean, or the robot is there currently, or if the charger is there
                fstats(1)=fstats(1)+1;  % Add one to the number of spaces that do not need cleaning
            end
            if floorplan(L,W)~=0  %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                fstats(2)=fstats(2)+1;  %Add one to number of spaces that the robot could potentially clean
            end
            if floorplan(L,W)==4  %If the space is dirty, take special note of that space for the smart robot to take care of later.
                dirty=[dirty;L,W]; %#ok<AGROW>
            end
<<<<<<< HEAD
            if floorplan(L,W)~=1        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                rloc=[L W];             %Saves robot location
            end
            if floorplan(L,W)~=2        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
=======
            if floorplan(L,W)==1        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
                rloc=[L W];             %Saves robot location
            end
            if floorplan(L,W)==2        %If the robot can move to the space (may want to add an option to determine if there are 0s in all 8 directions even if the space is not 0)
>>>>>>> 3efeb8af2c08d848790d3cc3adfef4d4bfa8db8f
                cloc=[L W];             %Saves charger location
            end
        end
    end
end

        
