%3Dr Clears everything and sets up the Laseraxe and Oscilloscope
if exist('serialobject') == 1
    deviceFinish;
end

instrreset
demoFlag=false;

addpath('.\oscilloscope\');
oscilloscopeSetup;



addpath('.\LaserAxe MATLAB\');
run('LaserAxe MATLAB\setup');




