%Takes readings from the scope and stores then into a measurement matrix

%Sets up matrix and reads value into matrix
reading = [ x_pos, y_pos, z_pos, 0 , 0 , 0 , 0, 0 ,0 ,0 ,0 ];

tcpip_command = 'MEASUREMENT:MEAS1:VALUE?\n';
reading_index = 4;
oscilloscopeTCP;
tcpip_command = 'MEASUREMENT:MEAS2:VALUE?\n';
reading_index = 5;
oscilloscopeTCP;
tcpip_command = 'MEASUREMENT:MEAS3:VALUE?\n';
reading_index = 6;
oscilloscopeTCP;
tcpip_command = 'MEASUREMENT:MEAS4:VALUE?\n';
reading_index = 7;
oscilloscopeTCP;
tcpip_command = 'MEASUREMENT:MEAS5:VALUE?\n';
reading_index = 8;
oscilloscopeTCP;
tcpip_command = 'MEASUREMENT:MEAS6:VALUE?\n';
reading_index = 9;
oscilloscopeTCP;
tcpip_command = 'MEASUREMENT:MEAS7:VALUE?\n';
reading_index = 10;
oscilloscopeTCP;
tcpip_command = 'MEASUREMENT:MEAS8:VALUE?\n';
reading_index = 11;
oscilloscopeTCP;

fprintf('   %4.2f %4.2f %4.2f %4.2f %4.3f %4.3f %4.2f %4.2f %4.1f %4.1f  \n', reading(1), reading(2), reading(3), reading(4), reading(5), reading(6), reading(7), reading(8), reading(9), reading(10))