%Move to Positions X, Y and Z defined by x_pos, y_pos and z_pos



%Check Validity of Serial Object
if not(isvalid(serialobject))
    fprintf('WARNING: CNC Connection Broken, rebuilding \n')
    %reset All Instruments
    instrreset
    %setup CNC
    setup;
    %reset the head to origin
    remotePositionReset;
    %reset All Instruments again
    instrreset
    %setup CNC at origin
    setup;
    %setup the Scope
    oscilloscopeSetup
end



% %Wait Timing
% % At default the motors took 61 s to move 500 mm, therefore 0.122s per mm
% % so a delay is needed for motion
% s_per_mm = 0.0352;
% z_s_per_mm = 0.0352;
% dx = abs(x_pos - x_now);
% dy = abs(y_pos - y_now);
% dz = abs(z_pos - z_now);
% dx_s = dx * s_per_mm + .5;
% dy_s = dy * s_per_mm + .5;
% dz_s = dz * z_s_per_mm + .5;

%Send Commands to Move in X (negative sign from construction orientation)
serial_command = ['G0 X', num2str(-x_pos), ' Y' , num2str(y_pos), ' Z' , num2str(-z_pos), '\n'];
fprintf(serialobject, serial_command);

% %Send Commands to Move in Y
% serial_command = ['G0 Y', , '\n'];
% fprintf(serialobject, serial_command);

% %Delay the script for motion
% if dx_s > dy_s
%     if dz_s > dx_s
%         fprintf('Z Move %4.1f , will take: %4.1f seconds \n',dz, dz_s)
%         pause(dz_s);
%     else
%         fprintf('X Move %4.1f , will take: %4.1f seconds \n',dx, dx_s)
%         pause(dx_s);
%     end
% else
%     if dz_s > dy_s
%         fprintf('Z Move %4.1f , will take: %4.1f seconds \n',dz, dz_s)
%         pause(dz_s);
%     else
%         fprintf('Y Move %4.1f , will take: %4.1f seconds \n',dy, dy_s)
%         pause(dy_s);
%     end 
% end
state = ['not populated'];

while not(contains(state,'<Idle'))
    pause(.5);
    flushinput(serialobject);
    fprintf(serialobject,"%s","?");
    pause(.10);
    state  = fscanf(serialobject);
    % Enable this to get verbose position updates to screen
    % fprintf('Moving, details %s \n', state)
end

x_now = x_pos;
y_now = y_pos;
z_now = z_pos;
% Optional Report Position
%fprintf('Positioned at X %4.1f , Y %4.1f , Z %4.1f \n',x_now, y_now, z_now)