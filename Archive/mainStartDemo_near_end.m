%3Dr Use this script setup and run experiement from a clean startup
fprintf('****Experiment Starting**** \n')

if exist('serialobject') == 0
    deviceSetup; 
    pause(5);
end

plotSetup



measurementSetup;
x_pos = 650; y_pos = 50; z_pos = 0; movetoXY
y_start = 17;

measurementSweep;

fprintf('****Experiment complete**** \n')