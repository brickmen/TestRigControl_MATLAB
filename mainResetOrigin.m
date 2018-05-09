%3Dr This script crashes the CNC head to the origin to remotely repositon (0,0)
%Reset Movement
fprintf('****Resetting Origin**** \n')
mainSetup;
pause(5);
run('LaserAxe MATLAB\remotePositionReset');
mainSetup;
pause(5);
