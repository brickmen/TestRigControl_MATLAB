% %DISABLED Plots the surface display at the end of rows
[X,Y] = meshgrid(x_range_start:1:x_range_end,y_range_start:1:y_range_end);

resultsSoFar = results(1:runIndex,:);
plotValues = resultsSoFar;

for i = 1:1:runIndex
    Mp1(i) = (1000000* plotValues(i,6) /  (plotValues(i,5)*2*pi*plotValues(i,11)));
    Mp2(i) = (1000000* plotValues(i,7) /  (plotValues(i,5)*2*pi*plotValues(i,11)));
    plotValues(i,6) = plotValues(i,6) + plotValues(i,7);
    plotValues(i,8) = Mp1(i);
    plotValues(i,9) = Mp2(i);
    plotValues(i,7) = Mp1(i) + Mp2(i);
end


Z_Ch=griddata(plotValues(:,1),plotValues(:,2),[plotValues(:,6)],X,Y);
contourf(ax1, X, Y,Z_Ch,8)
%caxis(ax4,[0 10])
title(ax1,['[' demoText '] Voltage Contour, Both'])
xlabel(ax1,'Slide (X) Position')
ylabel(ax1,'Offset (Y) Position')
colorbar(ax1,'eastoutside')

Z_Ch=griddata(plotValues(:,1),plotValues(:,2),[plotValues(:,7)],X,Y);
contourf(ax2, X, Y,Z_Ch,8)
%caxis(ax4,[0 10])
title(ax2,['[' demoText '] Mutual Contour, both'])
xlabel(ax2,'Slide (X) Position')
ylabel(ax2,'Offset (Y) Position')
colorbar(ax2,'westoutside')



Z_Ch=griddata(plotValues(:,1),plotValues(:,2),plotValues(:,8),X,Y);
contourf(ax3, X, Y,Z_Ch,8)
%caxis(ax4,[0 10])
title(ax3,['[' demoText '] Mutual Contour, P1'])
xlabel(ax3,'Slide (X) Position')
ylabel(ax3,'Offset (Y) Position')
colorbar(ax3,'eastoutside')

Z_Ch=griddata(plotValues(:,1),plotValues(:,2),plotValues(:,9),X,Y);
contourf(ax4, X, Y,Z_Ch,8)
%caxis(ax4,[0 10])
title(ax4,['[' demoText '] Mutual Contour, P2'])
xlabel(ax4,'Slide (X) Position')
ylabel(ax4,'Offset (Y) Position')
colorbar(ax4,'westoutside')

%make Graphs Pretty
ax1.XGrid = 'on';
ax1.YGrid = 'on';


ax2.XGrid = 'on';
ax2.YGrid = 'on';


ax3.XGrid = 'on';
ax3.YGrid = 'on';


ax4.XGrid = 'on';
ax4.YGrid = 'on';


