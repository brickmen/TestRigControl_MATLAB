%3Dr Use this script setup and run experiment from a clean startup post device setup
fprintf('****Experiment Starting**** \n')

if exist('serialobject') == 0
    fprintf('****Error Devices Not Ready**** \n')
    return
end

plotSetup;

measurementSetup;

%x_pos = 650; y_pos = 50; z_pos = 0; movetoXY
%y_start = 3;

measurementSweep;

fprintf('****Experiment complete**** \n')