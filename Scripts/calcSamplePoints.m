% Calculate Total points and resolution if needed
% Measurements can be defined either by a desired resolution between
% each sample (defineByResolution = 1) or by a number of measurements within
% the working area (defineByResolution = 0)

if defineByResolution == 1
    
    % 
    % %Calculate Working Area Matrix Size (Plus 1 for linspace calculation)
    x_total_points = ceil(abs(x_range_end - x_range_start) / x_step +1);
    y_total_points = ceil(abs(y_range_end - y_range_start) / y_step +1);
    z_total_points = ceil(abs(z_range_end - z_range_start) / z_step +1);
else
    
    x_step = (x_range_end - x_range_start)/x_total_points;
    y_step = (y_range_end - y_range_start)/y_total_points;
    z_step = (z_range_end - z_range_start)/z_total_points;
end
total_points = x_total_points * y_total_points * z_total_points;
ETA_hrs = total_points / 720; %Experience shows a rate of 720 per hour