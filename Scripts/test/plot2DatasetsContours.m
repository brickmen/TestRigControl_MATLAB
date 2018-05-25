% plots 2 datasets
figure(1);
ax1 = subplot(2,2,1); % top left subplot
ax2 = subplot(2,2,2); % top right subplot
ax3 = subplot(2,2,3); % bottom left subplot
ax4 = subplot(2,2,4); % bottom right subplot
%[X,Y] = meshgrid(x_position_sweep,y_position_sweep);

title(ax1,' Figure 1')
title(ax2,' Figure 2')
title(ax3,' Figure 3')
title(ax4,' Figure 4')

colormap('jet');

plotValues = run5;
plotValues2 = run4;

x_min_limit = -80;
x_max_limit = 80;
y_min_limit = -80;
y_max_limit = 80;

[X,Y] = meshgrid(x_min_limit:10:x_max_limit,y_min_limit:10:y_max_limit);

Z_Ch3=griddata(plotValues2(:,1),plotValues2(:,2),plotValues2(:,4),X,Y);
contourf(ax1, X, Y,Z_Ch3, 8)
%caxis(ax2,[0 10])
title(ax1,['Run 4'])
xlabel(ax1,'Slide (X) Position')
ylabel(ax1,'Offset (Y) Position')
colorbar(ax1,'eastoutside')

Z_Ch3=griddata(plotValues2(:,1),plotValues2(:,2),plotValues2(:,6),X,Y);
contourf(ax2, X, Y,Z_Ch3, 8)
caxis(ax2,[120000 140000])
title(ax2,['Run 4 RMS'])
xlabel(ax2,'Slide (X) Position')
ylabel(ax2,'Offset (Y) Position')
colorbar(ax2,'eastoutside')

Z_Ch4=griddata(plotValues(:,1),plotValues(:,2),plotValues(:,4),X,Y);
contourf(ax3, X, Y,Z_Ch4,8)
%caxis(ax4,[0 10])
title(ax3,['Run 5'])
xlabel(ax3,'Slide (X) Position')
ylabel(ax3,'Offset (Y) Position')
colorbar(ax3,'eastoutside')

Z_Ch4=griddata(plotValues(:,1),plotValues(:,2),plotValues(:,6),X,Y);
contourf(ax4, X, Y,Z_Ch4,8)
caxis(ax4,[140000 160000])
title(ax4,['Run 5 RMS'])
xlabel(ax4,'Slide (X) Position')
ylabel(ax4,'Offset (Y) Position')
colorbar(ax4,'eastoutside')