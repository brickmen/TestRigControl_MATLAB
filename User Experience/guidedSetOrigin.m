% Use this script to set the origin of the coils

%step 2, ask users for a XY region to start looking in
fprintf('What is the XY origin position.\n')
fprintf('To do this a range is needed from the user.\n')

fprintf('X Zero:\n')
ux_num = 0;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
x_pos = ux_num;

fprintf('Y Zero:\n')
ux_num = 0;
getUserNum;
if ux_user_input == 's'
    fprintf('Cancelling\n')
    return
end
y_pos = ux_num;
z_pos = 0;
movetoXY;

fclose(serialobject);
setup;