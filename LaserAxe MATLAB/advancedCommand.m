%FOR TESTING Manual/Advanced Commands can be sent to device
%see
% https://github.com/grbl/grbl/wiki/Configuring-Grbl-v0.9#grbl-settings
serial_command = ['$111=2000', '\n'];
fprintf(serialobject, serial_command);

fprintf(serial_command);