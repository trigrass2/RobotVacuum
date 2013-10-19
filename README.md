RobotVacuum
===========

Matlab code for EGR270 robot project

SPECIFICATION
The manufacturer plans to develop three models of robotic vacuums: 
 The economy robot. This robot should clean 100% of the floor in a floor plan, even if the surface has been 
detected to be clean. The battery life of the economy robot is poor. 
 The regular robot. This robot should clean 100% of the floor in a floor plan, even if the surface has been 
detected to be clean. The battery life of the regular robot is average. 
 The high-end “intelligent” robot. This robot should only clean the dirty parts of the floor. The battery life 
of the high-end robot is poor. 
 Your algorithms should be written in MATLAB code. In addition to the code, the manufacturer requests 
pseudocode describing the algorithms created using Microsoft Word / PowerPoint, or saved as Adobe PDFs. 
 The “sensing capabilities” of the robot will generate a matrix. You may assume that the manufacturer has a 
separate interface to generate the matrix, so you will not need to develop the sensor—instead, you will write 
your code assuming that the matrix is provided by some separate mechanism. Test matrices are provided by 
the manufacturer in a Microsoft Excel workbook. Additionally, a blank floor plan is provided in the workbook 
for creating your own custom floor plan. 
 Your team will need to export movies of your robot cleaning each of the provided floor plans. The provided 
Microsoft Excel file with floor plan matrices also contains a blank floor plan so that you can create your own 
custom floor plan for testing. Upon completion, you should have 12 total movies of your 3 vacuums cleaning 
the 4 different floor plans, all due at the same time as the source code. For more information on functions that 
will be helpful to generate videos in MATLAB, see the last two pages of this document. 
 Before the manufacturer will develop prototypes, they want a presentation describing your designs and a brief 
performance analysis of each robot

Each program/function must contain: 
 A standard header similar to the one in Chapter 7 of the textbook, plus: 
o Team number 
o First and last names of each team member 
o Documentation of all variables used in the code 
 Comments throughout the code 
 
Save each image processing function as a separate file with the following naming scheme: 
 
 The economy model (saved as economy_TEAM.m) 
 The regular model (saved as regular_TEAM.m) 
 The high end model (saved as highend_TEAM.m) 
 
In addition, you should create a main program that will allow the user to select (using menus or something similar) 
the Excel file containing the floor plan, the sheet name in the Excel file that contains the floor plan, the model, and 
whether or not the code should export a floor plan movie after your vacuum finishes cleaning the floor plan. Save 
this program as VacuumProject_TEAM.m, where TEAM is your team identifier. 
 
In addition to the requirements defined above, each robot should display a summary (after cleaning a floor plan), 
including: 
 The ratio of clean floor to dirty floor. For example “36% of the floor was covered with dirt.” 
 The area of the floor plan. You may assume that each “pixel” represents a 1 ft x 1 ft tile. “Floor plan 
surface area: 1200 square feet 
 The amount of time it took the robot to clean the floor. You may assume that it takes 5 seconds to clean a 
single dirty “pixel” on the floor. It takes 1 second to traverse a pixel without cleaning it. 
 The number of times the robot had to recharge. “The robot had to recharge 5 times.” 
o A robot with “poor” battery life will be able to clean 250 square feet before recharging. 
o A robot with “average” battery life will be able to clean 350 square feet before recharging. 
o You may assume that it takes every robot 60 seconds to recharge. When the robot’s battery is 
empty, it will travel back to the charge station at a rate of 1 pixel per second. After it is fully 
charged, it will return to where it left off at a rate of 1 pixel per second (without cleaning on the 
return path.) 
o If the robot isn’t cleaning, you may assume that no battery is being used. You may move across 
the floor at an angle. For angled movements, it is not necessary for the movement to be made up 
of horizontal and vertical movements. You may move at any diagonal angle. 
 
Your source code will be evaluated based on: 
 Documentation (30%) - all code must include adequate header information and comments throughout the 
source code 
 Reusability (25%) - all code repeated frequently throughout your project should appear in well 
documented functions 
 Specification (25%) - all code should meet the project requirements outlined in the project description. 
Note that your code will be tested on secret floor plans. Your code will be evaluated not only on how well 
it does on the four floor plans that I have distributed, but also on my secret floor plans. 
 Efficiency (20%) - No extraneous calls to unnecessary functions or other poor software design decisions. 
