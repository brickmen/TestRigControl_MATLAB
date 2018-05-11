%3Dr Use this script setup and run experiment from a clean startup post device setup
fprintf('****Demo Starting**** \n')
% Set Demo Flag
demoFlag=true;
% Set Paths
addpath('.\Demo\');
addpath('.\Plotting\');
addpath('.\Scripts\');
% Load up Demo Dataset
load('demo_data.mat')
% Setup Plots
plotSetup;
% Reload Whole Dataset and restores all useful positioning values
reloadResults;
storedResults = results;
% Checks to see if Serial Device is available, if it is, it'll be used
if exist('serialobject') == 0
    fprintf('No Serial devices setup. If you wish to use rig this needs to be setup first \n')
    fprintf('For now we will fake the positining \n')
    addpath('.\Demo\fakeMovement')
    ux_prompt = ' What Fake Delay between positions in ms ?, <c> to cancel: ';
    ux_user_input = input(ux_prompt, 's');
    switch ux_user_input
        case 'c'
            fprintf(' Cancelling\n')
            return
        otherwise
            fakeDelay = str2num(ux_user_input)/1000;
    end
else
    fprintf('Using Test Rig \n')
end


ux_user_input = '1';
while ux_user_input == '1'
    fprintf('What row would you like to start the demo? available: %i \n', y_total_points)
    ux_prompt = ' <Integer> or  <c> to cancel: ';
    ux_user_input = input(ux_prompt, 's');
    switch ux_user_input
        case 'c'
            fprintf(' Cancelling\n')
            return
        otherwise
            y_start = str2num(ux_user_input);

    end
    ux_prompt = ' Ready to start Demo. <1> when ready or <> to cancel: ';
    ux_user_input = input(ux_prompt, 's');
    switch ux_user_input
        case '1'
            fprintf(' Demo Starting...\n')
        otherwise
            fprintf(' Cancelling\n')
            return

    end
    x_pos = 0;
    y_pos = 0;
    z_pos = 0;

    measurementSweep; 
end

fprintf('****Demo complete**** \n')