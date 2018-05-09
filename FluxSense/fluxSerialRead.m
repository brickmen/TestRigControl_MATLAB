flushinput(serialobject_flux);
pause(.05);
flux_str  = fscanf(serialobject_flux);
flux_split = strsplit(char(flux_str),',');