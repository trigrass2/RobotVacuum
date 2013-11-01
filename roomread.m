function R=roomread(fname,sname)
%function R=roomread(fname,sname)
%Reads data from excel file and creates an image
%Input Arguments:
% fname: filename of excel file containing sensor data, as script
% sname: sheet name in excel file with sensor data, as a script or sheet
%        number as a scalar.
%Output Arguments:
% R: Matrix of data for analysis
R=xlsread(fname,sname);
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