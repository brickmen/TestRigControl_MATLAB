% FOR TESTING to manually send commands to scope
tcpip_command = 'MEASUREMENT:MEAS8:VALUE?\n'
pause(.25);
flushinput(t);
fprintf(t,"%s",tcpip_command);
val = fscanf(t,"%lf")