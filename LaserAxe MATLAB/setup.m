%(CONSIDER ZPOS) Setup Of Serial Coomunication
serialobject=serial('COM7','BaudRate',115200);
fopen(serialobject);
x_now = 0;
y_now = 0;
z_now = 0;
x_pos = 0;
y_pos = 0;
z_pos = 0;