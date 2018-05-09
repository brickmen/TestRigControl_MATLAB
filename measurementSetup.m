%3Dr Sets up the Movement and Measurement area
%set to Demo for demo mode
demoFlag = false;

%Define Working Area
setStandardRange;


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