
%% Generates a list of the neighbor nodes from current location.
function [n]=neighbor_nodes(current)
n=[current(1)-1,current(2)-1;current(1)-1,current(2);current(1)-1,current(2)+1;current(1),current(2)-1;current(1),current(2)+1;current(1)+1,current(2)-1;current(1)+1,current(2);current(1)+1,current(2)+1];
%