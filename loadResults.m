%Loads up previously completed results

%Open Results file
addpath('.\Results\');
load('backup_16-02-18_09-21.mat')
%remove any zero rows
results = results(any(results,2),:);

%Is it a demo?
demoFlag = true;

%ReDefine Working Area from results
x_range_start = min(results(:,1)); %mm
x_range_end = max(results(:,1));
y_range_start = min(results(:,2));
y_range_end = max(results(:,2));
z_range_start = min(results(:,3));
z_range_end = max(results(:,3));

%Redefine measurement points from results
x_position_sweep = unique(results(:,1)); 
y_position_sweep = unique(results(:,2));
z_position_sweep = unique(results(:,3));
x_total_points = length(x_position_sweep); 
y_total_points = length(y_position_sweep);
z_total_points = length(z_position_sweep);
total_points = x_total_points * y_total_points * z_total_points;

%Write information to screen
fprintf('Range [points]  X:%4.2f to %4.2f [ %4.2f ]  \n', x_range_start,x_range_end,x_total_points)
fprintf('Range [points]  Y:%4.2f to %4.2f [ %4.2f ]  \n', y_range_start,y_range_end,y_total_points)
fprintf('Range [points]  Z:%4.2f to %4.2f [ %4.2f ]  \n', z_range_start,z_range_end,z_total_points)
fprintf('Read   %i of expected %i   \n', runIndex, total_points )
if runIndex == total_points
    fprintf('     YAY its a complete data set :) !\n' )
end



%Setup Index and Percent Complete
runIndex = length(results);
percentComplete = 100;


%begin Plotting
addpath('.\Plotting\');
plotSetup;
plotEachZ;
plotEachX;
plotEachY;

