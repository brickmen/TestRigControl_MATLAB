% load reading based on XYZ value
I = find(results(:,1)==x_pos & results(:,2)==y_pos & results(:,3)==z_pos);
reading = results(I,:);

fprintf('   %4.2f %4.2f %4.2f %4.2f %4.3f %4.3f %4.2f %4.2f %4.1f %4.1f  \n', reading(1), reading(2), reading(3), reading(4), reading(5), reading(6), reading(7), reading(8), reading(9), reading(10))