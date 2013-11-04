%% Generates a weighted value to prioritize cleaning dirty spaces while avoiding areas that have already been covered
function w=weighting(neighbor,R)
switch R(neighbor(1),neighbor(2))
case 0
 w=1/eps;
case 4
 w=9;
case 5
 w=11;
otherwise
 w=10;
end
%Weights are tentative requiring testing