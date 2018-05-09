% %DISABLED Plots the surface display at the end of rows
[X,Y] = meshgrid(x_range_start:5:x_range_end,y_range_start:5:y_range_end);

resultsSoFar = results(1:runIndex,:);
plotValues = resultsSoFar(resultsSoFar(:,3)==z_range_end,:);
plotValues2 = resultsSoFar(resultsSoFar(:,3)==z_range_start,:);

% Z_Ch3=griddata(resultsSoFar(:,1),resultsSoFar(:,2),resultsSoFar(:,5),X,Y);
% surf(ax1, X, Y, Z_Ch3, 'EdgeColor','none')
% title(ax1,' CH3 Voltage Surface (updated at row end)')
% xlabel(ax1,'Slide (X) Position')
% ylabel(ax1,'Offset (Y) Position')
% zlabel(ax1, 'Volts RMS')
% %legend(ax1,'src-pickup','src-rectifier')
% grid(ax1,'on')
% grid(ax1,'minor')
% surf(ax2, X, Y, Z_Ch4, 'EdgeColor','none')
% title(ax2,' CH4 Voltage Surface (updated at row end)')
% xlabel(ax2,'Slide (X) Position')
% ylabel(ax2,'Offset (Y) Position')
% zlabel(ax2, 'Volts RMS')
% %legend(ax1,'src-pickup','src-rectifier')
% grid(ax2,'on')
% grid(ax2,'minor')


Z_Ch4=griddata(plotValues(:,1),plotValues(:,2),[plotValues(:,6)+plotValues(:,7)],X,Y);
contourf(ax4, X, Y,Z_Ch4)
caxis(ax4,[0 10])
title(ax4,['[' demoText '] Voltage Contour, both coils, Z Max'])
xlabel(ax4,'Slide (X) Position')
ylabel(ax4,'Offset (Y) Position')

Z_Ch3=griddata(plotValues2(:,1),plotValues2(:,2),[plotValues2(:,6)+plotValues2(:,7)],X,Y);
contourf(ax2, X, Y,Z_Ch3)
caxis(ax2,[0 10])
title(ax2,['[' demoText '] Voltage Contour, both coils, Z Min'])
xlabel(ax2,'Slide (X) Position')
ylabel(ax2,'Offset (Y) Position')