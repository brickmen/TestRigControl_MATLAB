% Use this script to help the system find the origin of the coils

% step 1, crash head on z axis
fprintf('STEP1: Crashing Head in Z axis to get to zero. Sorry for the noise.\n')
z_pos = 54;
movetoXY
z_pos = 0;
movetoXY

%step 2, ask users for a XY region to start looking in
fprintf('STEP2: Running a coarse sweep in XY to find peak of pickup values.\n')
fprintf('To do this a range is needed from the user.\n')

fprintf('X Start value:\n')
ux_num = 0;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
x_range_start = ux_num;

fprintf('X End value:\n')
ux_num = 0;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
x_range_end = ux_num;


fprintf('Y Start value:\n')
ux_num = 0;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
y_range_start = ux_num;

fprintf('Y End value:\n')
ux_num = 0;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
y_range_end = ux_num;

fprintf('Single Z value:\n')
ux_num = 0;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
z_range_start = ux_num;
z_range_end = ux_num;

fprintf('X Number of Points:\n')
ux_num = 10;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
x_total_points = ux_num + 1; %plus one for both end readings
fprintf('Y Number of Points:\n')
ux_num = 10;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
y_total_points = ux_num + 1; 
z_total_points = 0 + 1;

%Total Number of measurements
total_points = x_total_points * y_total_points * z_total_points;
results = zeros(total_points, 11);

%Build Position Matrix with linear spacing
x_position_sweep = linspace(x_range_start, x_range_end, x_total_points); 
y_position_sweep = linspace(y_range_start, y_range_end, y_total_points);
z_position_sweep = linspace(z_range_start, z_range_end, z_total_points);

%start at Y index 1
y_start = 1;

measurementSweep;
plotOriginFindHR;