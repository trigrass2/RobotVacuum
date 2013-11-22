function [frames,fps] = GetFrames(roomMap,frames,step)
%getFrames creates the frames for where the robot is
%Input args
% 
%Output args
%  

map=[;
     0 0 0;                       %black, 0, inaccessible
     1 0 0;                       %red,   1, current location
     0 0 1;                       %blue,  2, charger location
     127/255 50/255 50/255;       %brown, 3, dirty floor
     1 1 1;                       %white, 4, clean floor
     0 1 0;                       %green, 5, trail
     ];
    
    colormap(map);
    axis('image');
    axis off
    fps = 1;
 
for curImage=1:1:fps
    image(roomMap+1);
    %need this weird stuff so that everything turns out right
    frames(step*fps-fps+curImage) = getframe;
    %frames(step*fps-fps+curImage) = im2frame(roomMap+1,map);
    
end