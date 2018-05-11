%  Plots the value at every point on an Z sweep
% 
resultsSoFar = results(1:runIndex,:);
lastReading = results(runIndex,:);
plotValues = resultsSoFar(resultsSoFar(:,2)==lastReading(1,2),:);
plot3(ax1,plotValues(:,1),plotValues(:,3),plotValues(:,6),'o')

% title(ax3,[ num2str(percentComplete) ' Percent Complete, CH3 (red) CH4 (blue)'])
title(ax1,['[' demoText '] XZ Voltage Measured for Y = ' num2str(lastReading(1,2)) ])
xlabel(ax1,'Slide (X) Position')
ylabel(ax1,'Gap (Z) Position')
zlabel(ax1, 'Volts RMS')
%legend(ax1,'src-pickup','src-rectifier')
grid(ax1,'on')
grid(ax1,'minor')

%view(ax1,[175,25])