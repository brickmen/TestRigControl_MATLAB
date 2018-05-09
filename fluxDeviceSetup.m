%3Dr Clears everything and sets up the Laseraxe and Oscilloscope
clear
instrreset
if not(demoFlag)
    addpath('.\oscilloscope\');
    run('oscilloscope\oscilloscopeSetup.m');
end


addpath('.\LaserAxe MATLAB\');
run('LaserAxe MATLAB\setup');

addpath('.\Plotting\');

movetoHOME;



