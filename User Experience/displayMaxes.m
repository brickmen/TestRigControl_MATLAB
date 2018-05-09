% Takes an Existing dataset which includes origin, iteratively finds the
% origin

%find Max for each measurement
index_max_p1 = find(results(:,6) == max(results(:,6)));
index_max_p2 = find(results(:,7) == max(results(:,7)));

fprintf('V P1 Max:')
disp(results(index_max_p1,1:3))

fprintf('V P2 Max:')
disp(results(index_max_p2,1:3))

%find Max for each measurement
index_max_p1 = find(plotValues(:,6) == max(plotValues(:,6)));
index_max_p2 = find(plotValues(:,7) == max(plotValues(:,7)));

fprintf('M P1 Max:')
disp(results(index_max_p1,1:3))

fprintf('M P2 Max:')
disp(results(index_max_p2,1:3))