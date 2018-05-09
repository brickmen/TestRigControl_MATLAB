%3Dr Sweep logic and the reporting to console
ux_wb_msg = [ 'Measurement In Progress '];
ux_wb = waitbar(0,ux_wb_msg );
tic
for i=y_start:y_total_points
    %Plot The surface and contour, only IF ther is more than 2 Y rows
    k=1;
    j=1;
    
    if i > 2
        
        if demoFlag
          run('Plotting\Demo');
        end
        plotEachY;
    end
    
    %Y sweep first
    y_pos = y_position_sweep(i);
    if x_pos == x_range_end
        inverse_x_index = 1;
    else
       inverse_x_index = 0; 
    end
    
    for j=1:x_total_points 
        if inverse_x_index == 1;
            x_index = x_total_points - j + 1;
        else
           x_index = j; 
        end
        
        % X Position Second
        x_pos = x_position_sweep(x_index);
        run('LaserAxe MATLAB\movetoXY');
        if z_pos == z_range_end
            inverse_z_index = 1;
        else
           inverse_z_index = 0; 
        end

        for k=1:z_total_points
            runIndex = (k+((j-1)*z_total_points)+((i-1)*x_total_points*z_total_points));
            ratioComplete = runIndex/total_points;
            percentComplete = 100*ratioComplete;
            
            ux_wb_progress = ratioComplete;
            waitbar(ux_wb_progress,ux_wb);
            if inverse_z_index == 1
               z_index = z_total_points - k + 1;
            else
               z_index = k; 
            end
            % Z Position Third
            z_pos = z_position_sweep(z_index);
            run('LaserAxe MATLAB\movetoXY');

            % Run index identifies each measurement individually based on
            % its logical position in the linear space, y first, x second
            % and z third
         
            
            if demoFlag
                 run('Plotting\Demo');
            else
                %Take Measurement Now 
                run('oscilloscope\oscilloscopeReading');
                results(runIndex,:)= reading;
            end
            
            
            
            
            plotEachZ;
        end
        %At the end of each row plot the result
        fprintf('%4.2f %%  Y ( %i of %i ), X ( %i of %i )  \n', percentComplete, i, y_total_points, j, x_total_points)
        plotEachX;
        toc
    end
    
    
    if not(demoFlag)
        %Backup Measurements after every X sweep
        formatOut = 'dd-mm-yy_HH-MM';
        backupLocation = ['Backup\backup_', datestr(now,formatOut), '.mat'];
        save(backupLocation, 'results')
        fprintf('Backup complete: %s \n', backupLocation)
        restoreLocation = ['Backup\restore', '.mat'];
        save(restoreLocation, 'reading', 'backupLocation')
    end
    toc
    
end
close(ux_wb)