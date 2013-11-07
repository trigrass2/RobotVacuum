fclose('all');
clear
clc
%Generates a rectangular room of random dimensions between 10 and 100 with random variables 0-4.
%This version does not export to excel
R=randi([0,4],randi([10,15]),randi([10,15]));
%Replaces all 1s and 2s with random 3s or 4s.
[l,w]=size(R);
for li=1:l
    for wi=1:w
        if R(li,wi)==1 || R(li,wi)==2
            R(li,wi)=randi([3,4]);
        end
    end
end
%Creates walls around outer edge
R(:,1)=0;
R(1,:)=0;
R(size(R,1),:)=0;
R(:,size(R,2))=0;
%Places charger and robot at random points inside the room.
c=[randi([2,l-1]),randi([2,w-1])];
r=[randi([2,l-1]),randi([2,w-1])];
if c(1)==r(1) && c(2)==r(2)
    r(1)=randi([2,l-1]);
end
R(c(1),c(2))=2;
R(r(1),r(2))=1;
%Creates color map
map=[;
     0 0 0;                       %black, 0, inaccessible
     1 0 0;                       %red,   1, current location
     0 0 1;                       %blue,  2, charger location
     127/255 50/255 50/255;       %brown, 3, dirty floor
     1 1 1;                       %white, 4, clean floor
     ];
%Displays as image
image(R+1);
colormap(map);
axis('image');
axis off
