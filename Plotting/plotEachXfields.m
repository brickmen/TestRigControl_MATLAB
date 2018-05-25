%  Plots the value at every point on an X sweep
% 
resultsSoFar = results(1:runIndex,:);
plotValues = resultsSoFar(resultsSoFar(:,3)==z_range_end,:);
plotValues2 = resultsSoFar(resultsSoFar(:,3)==z_range_start,:);
plot3(ax3,plotValues(:,1),plotValues(:,2),plotValues(:,4),plotValues2(:,1),plotValues2(:,2),plotValues2(:,4),'r')

% title(ax3,[ num2str(percentComplete) ' Percent Complete, CH3 (red) CH4 (blue)'])
title(ax3,[ '[' demoText '] (' num2str(percentComplete) '%) Field Voltage Measured , Z Min (red) Z Max(blue)'])
xlabel(ax3,'Slide (X) Position')
ylabel(ax3,'Offset (Y) Position')
zlabel(ax3, 'Volts RMS')
%legend(ax1,'src-pickup','src-rectifier')
grid(ax3,'on')
grid(ax3,'minor')
view(ax3,[46,47])