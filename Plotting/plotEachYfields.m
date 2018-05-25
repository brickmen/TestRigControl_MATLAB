% Plots the surface display at the end of rows
[X,Y] = meshgrid(x_range_start:5:x_range_end,y_range_start:5:y_range_end);

resultsSoFar = results(1:runIndex,:);
plotValues = resultsSoFar(resultsSoFar(:,3)==z_range_end,:);
plotValues2 = resultsSoFar(resultsSoFar(:,3)==z_range_start,:);

Z_Ch4=griddata(plotValues(:,1),plotValues(:,2),[plotValues(:,4)],X,Y);
contourf(ax4, X, Y,Z_Ch4,8)
%caxis(ax4,[0 10])
title(ax4,['[' demoText '] Field Voltage Contour, Z Max'])
xlabel(ax4,'Slide (X) Position')
ylabel(ax4,'Offset (Y) Position')
colorbar(ax4,'eastoutside')

Z_Ch3=griddata(plotValues2(:,1),plotValues2(:,2),[plotValues2(:,4)],X,Y);
contourf(ax2, X, Y,Z_Ch3, 8)
%caxis(ax2,[0 10])
title(ax2,['[' demoText '] Field Voltage Contour, Z Min'])
xlabel(ax2,'Slide (X) Position')
ylabel(ax2,'Offset (Y) Position')
colorbar(ax2,'eastoutside')