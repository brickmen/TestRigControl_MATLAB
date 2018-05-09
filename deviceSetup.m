%3Dr Clears everything and sets up the Laseraxe and Oscilloscope
clear
instrreset
demoFlag=false;

addpath('.\oscilloscope\');
oscilloscopeSetup;



addpath('.\LaserAxe MATLAB\');
run('LaserAxe MATLAB\setup');

addpath('.\Plotting\');
plotSetup;



