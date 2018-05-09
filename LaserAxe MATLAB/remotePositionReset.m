%(NOT CONF FOR 3D) This will reset the position by crashing the head. Use with caution.

serial_command = ['G0 X', num2str(x_max), '\n'];
fprintf(serialobject, serial_command);
fprintf('Waiting for X dir push is complete, 40s \n')
pause(40);

serial_command = ['G0 Y' , num2str(-y_max), '\n'];
fprintf(serialobject, serial_command);
fprintf('Waiting for Y dir push is complete, 40s \n')
pause(40);

fclose(serialobject);