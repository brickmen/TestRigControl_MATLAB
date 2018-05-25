%3D Set up the Movement and Measurement area
%set to Demo for demo mode



demoFlag = false;
% Get total Sample Points
calcSamplePoints;
% Display to Console
fprintf('Range Set: \n')
fprintf(' X: %4.2f -> %4.2f at %4.2f ( %i points) \n', x_range_start, x_range_end, x_step, x_total_points)
fprintf(' Y: %4.2f -> %4.2f at %4.2f ( %i points) \n', y_range_start, y_range_end, y_step, y_total_points)
fprintf(' Z: %4.2f -> %4.2f at %4.2f ( %i points) \n', z_range_start, z_range_end, z_step, z_total_points)
fprintf(' Total Points %i \n', total_points)
fprintf(' Expected time to completion of run: %4.2f hours \n', ETA_hrs)
%Build Position Matrix with linear spacing
x_position_sweep = linspace(x_range_start, x_range_end, x_total_points); 
y_position_sweep = linspace(y_range_start, y_range_end, y_total_points);
z_position_sweep = linspace(z_range_start, z_range_end, z_total_points);


%Total Number of measurements
total_points = x_total_points * y_total_points * z_total_points;
results = zeros(total_points, 11);


%start at Y index 1
y_start = 1;

%(Optional) Start at home
%run('LaserAxe MATLAB\movetoHOME');