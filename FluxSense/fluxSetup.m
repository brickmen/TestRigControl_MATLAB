% Setup Of Serial Comunication to flux measurement
serialobject_flux=serial('COM8','BaudRate',9600);
fopen(serialobject_flux);
