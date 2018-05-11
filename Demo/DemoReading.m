

I = find(storedResults(:,1)==x_pos & storedResults(:,2)==y_pos & storedResults(:,3)==z_pos);
reading = storedResults(I,:);

fprintf('  [%i] %4.2f %4.2f %4.2f %4.2f %4.3f %4.3f %4.2f %4.2f %4.1f %4.1f  \n', I,reading(1), reading(2), reading(3), reading(4), reading(5), reading(6), reading(7), reading(8), reading(9), reading(10))