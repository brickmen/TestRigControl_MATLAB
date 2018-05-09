% %DISABLED Setup Plot Axes
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
view(ax1,[175,25])

if demoFlag
    demoText = 'Demo';
else
    demoText = 'Live';  
end
colormap('jet');