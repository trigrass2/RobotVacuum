%% Generates hueristics for current location
function h=h_estimate(current,goal)
h=sum(abs(goal-current));