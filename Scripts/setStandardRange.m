%Sets Up The Extended Range
x_range_start = -60; %mm
x_range_end = 60;
y_range_start = -60;
y_range_end = 60;
z_range_start = 0;
z_range_end = 50;
% %Define Resolution
x_step = 2; %mm
y_step = 2; %mm
z_step = 10; %mm

% Measurements can be defined either by a desired resolution between
% each sample (defineByResolution = 1) or by a number of measurements within
% the working area (defineByResolution = 0)
defineByResolution = 1;
if defineByResolution == 1
    
    % 
    % %Calculate Working Area Matrix Size (Plus 1 for linspace calculation)
    x_total_points = ceil(abs(x_range_end - x_range_start) / x_step +1);
    y_total_points = ceil(abs(y_range_end - y_range_start) / y_step +1);
    z_total_points = ceil(abs(z_range_end - z_range_start) / z_step +1);
else
    % Define Number of Measurements
    x_total_points = 24 + 1; %plus one for both end readings
    y_total_points = 16 + 1;
    z_total_points = 8 + 1;
end
total_points = x_total_points * y_total_points * z_total_points;
ETA_hrs = total_points / 720; %Experience shows a rate of 720 per hour
fprintf(' Expected time to completion of run: %f hours \n', ETA_hrs)