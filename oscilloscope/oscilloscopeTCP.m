% Extracts the reading from the scope, and checks data integrity, will retry if it fails
if not(isvalid(t))
    fprintf('WARNING: Scope Connection Broken, rebuilding \n')
    fclose(t);
    t = tcpip('192.168.1.2',4000);
    fopen(t);
    pause(1);
    flushinput(t);
    pause(5);
end
pause(.35);
flushinput(t);
fprintf(t,"%s",tcpip_command);
pause(.10);
readVal  = fscanf(t,"%lf");
if isfloat(readVal)
    reading(reading_index) = readVal;
else
    fprintf('WARNING: Failed to read from scope will retry twice \n')
    pause(1);
    flushinput(t);
    fprintf(t,"%s",tcpip_command);
    pause(1);
    readVal  = fscanf(t,"%lf");
    if isfloat(readVal)
        reading(reading_index) = readVal;
    else
        fprintf('WARNING: Failed to read from scope will retry once more by rebuilding the scope connection \n')
        fclose(t);
        t = tcpip('192.168.1.2',4000);
        fopen(t);
        pause(1);
        flushinput(t);
        pause(5);
        fprintf(t,"%s",tcpip_command);
        pause(1);
        readVal  = fscanf(t,"%lf");
        if isfloat(readVal)
            reading(reading_index) = readVal;
        else
            fprintf('!!!ERROR Cannot read from Scope \n')
        end
    end
end