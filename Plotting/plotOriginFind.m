% %DISABLED Plots the surface display at the end of rows
[X,Y] = meshgrid(x_range_start:1:x_range_end,y_range_start:1:y_range_end);

resultsSoFar = results(1:runIndex,:);
plotValues = resultsSoFar(resultsSoFar(:,3)==z_range_end,:);
plotValues2 = resultsSoFar(resultsSoFar(:,3)==z_range_start,:);




Z_Ch=griddata(plotValues(:,1),plotValues(:,2),[plotValues(:,6)],X,Y);
contourf(ax1, X, Y,Z_Ch,8)
%caxis(ax4,[0 10])
title(ax1,['[' demoText '] Voltage Contour, P1'])
xlabel(ax1,'Slide (X) Position')
ylabel(ax1,'Offset (Y) Position')
colorbar(ax1,'eastoutside')

Z_Ch=griddata(plotValues(:,1),plotValues(:,2),[plotValues(:,7)],X,Y);
contourf(ax2, X, Y,Z_Ch,8)
%caxis(ax4,[0 10])
title(ax2,['[' demoText '] Voltage Contour, P2'])
xlabel(ax2,'Slide (X) Position')
ylabel(ax2,'Offset (Y) Position')
colorbar(ax2,'westoutside')

%make Graphs Pretty
ax1.XGrid = 'on';
ax1.YGrid = 'on';


ax2.XGrid = 'on';
ax2.YGrid = 'on';


ax3.XGrid = 'on';
ax3.YGrid = 'on';


ax4.XGrid = 'on';
ax4.YGrid = 'on';


