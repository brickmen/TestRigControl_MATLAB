%3D Sweep logic and recording and reporting to console
ux_wb_msg = [ 'Measurement In Progress '];
ux_wb = waitbar(0,ux_wb_msg );
tic
% Y Sweep Is top Level
for i=y_start:y_total_points
    %Plot The surface and contour, only IF ther is more than 2 Y rows
    k=1;
    j=1;
    if i > 2
        plotEachYfields;
    end
    % Prepare Y Position
    y_pos = y_position_sweep(i);
    % Reverse Index flag in X to avoid unnecessary head movement
    if x_pos == x_range_end
        inverse_x_index = 1;
    else
       inverse_x_index = 0; 
    end
    % X Sweep Is Second Level
    for j=1:x_total_points
        % Reverse Index Logic to avoid unnecessary head movement
        if inverse_x_index == 1
            x_index = x_total_points - j + 1;
        else
           x_index = j; 
        end
        % X Position Setup Second
        x_pos = x_position_sweep(x_index);
        % Reverse Index flag in Z to avoid unnecessary head movement
        if z_pos == z_range_end
            inverse_z_index = 1;
        else
           inverse_z_index = 0; 
        end
        % Z Sweep Is Third Level
        for k=1:z_total_points
            % Reverse Index Logic to avoid unnecessary head movement
            if inverse_z_index == 1
               z_index = z_total_points - k + 1;
            else
               z_index = k; 
            end
            % Z Position setup
            z_pos = z_position_sweep(z_index);
            % Apply Positions to Rig
            movetoXY;
            % Setup Variables for Data Recording and Display
            runIndex = (k+((j-1)*z_total_points)+((i-1)*x_total_points*z_total_points));
            ratioComplete = runIndex/total_points;
            percentComplete = 100*ratioComplete;
            % Update Waitbar
            ux_wb_progress = ratioComplete;
            waitbar(ux_wb_progress,ux_wb);
            % Take Reading or Extract Stored Reading
            if demoFlag
                 %Restore Measurement to reading 
                 run('Demo\DemoReading');
                 %Store Reading in results
                 results(runIndex,:)= reading;
            else
                %Take Measurement to reading 
                oscilloscopeReading3only;
                %Store Reading in results
                results(runIndex,:)= reading;
            end
            % Update Top Left Plot
            plotEachZfields;
        end
        % Print Status to Screen
        fprintf('%4.2f %%  Y ( %i of %i ), X ( %i of %i )  \n', percentComplete, i, y_total_points, j, x_total_points)
        toc
        % At the end of each row update Lower Left Plot
        plotEachXfields;
    end   
    % Runs Data Backup at the end of each row
    if not(demoFlag)
        %Backup Measurements after every X sweep
        formatOut = 'dd-mm-yy_HH-MM';
        backupLocation = ['User-Data\Backup\backup_', datestr(now,formatOut), '.mat'];
        save(backupLocation, 'results')
        fprintf('Backup complete: %s \n', backupLocation)
        restoreLocation = ['User-Data\Backup\restore', '.mat'];
        save(restoreLocation, 'reading', 'backupLocation')
    end
end
%Final Plot of Y
plotEachYfields;
% Close Waitbar
close(ux_wb)