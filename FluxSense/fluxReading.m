%Takes readings from the magnetosensor stores then into a measurement matrix

%Sets up matrix and reads value into matrix
flux_reading = [ x_pos, y_pos, z_pos, 0 , 0 , 0 , 0, 0 ,0 ,0 ,0 ];
if not(isvalid(serialobject_flux))
    fprintf('WARNING: FluxSense Connection Broken, rebuilding \n')
    fluxClose;
    fluxSetup;
    flushinput(serialobject_flux);
    pause(5);
end
%Take 10 readings
flux_raw = zeros(10,6);
for flux_count = 1:1:10
    
    flux_str = '0';
    while length(flux_str) < 40
        fluxSerialRead;
    end
    
    flux_raw(flux_count,:) = [ str2double(flux_split(2)) str2double(flux_split(3)) str2double(flux_split(4)) str2double(flux_split(6)) str2double(flux_split(7)) str2double(flux_split(8))];
    
    pause(.10);
end
%average results to column
for flux_count = 1:1:6

    flux_reading_column = flux_count +3 ;
    flux_reading(flux_reading_column) = mean(flux_raw(:,flux_count));

end
fprintf('   %4.2f %4.2f %4.2f %4.2f %4.3f %4.3f %4.2f %4.2f %4.1f %4.1f  \n', flux_reading(1), flux_reading(2), flux_reading(3), flux_reading(4), flux_reading(5), flux_reading(6), flux_reading(7), flux_reading(8), flux_reading(9), flux_reading(10))