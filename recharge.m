%%Returns robot to charger
function [rloc,battery,at]=recharge(R,rloc,cloc,battery,ur)
%Calls Astar to find path to the charger from current location
route=Astar(R,rloc,cloc);
[rloc,R,ur,battery,at]=movepath(rloc,route,R,ur,battery); %#ok<*ASGLU>
battery=100;

