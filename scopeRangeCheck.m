% Quick Travel Range to see of the values are always within scope limits
x_pos = x_range_start; y_pos = y_range_start; z_pos = z_range_start; movetoXY
z_pos = z_range_end; movetoXY
x_pos = (x_range_start+x_range_end)/2; y_pos = (y_range_start+y_range_end)/2; z_pos = z_range_start; movetoXY
z_pos = z_range_end; movetoXY
z_pos = z_range_start; movetoXY
x_pos = x_range_end; y_pos = y_range_end; z_pos = z_range_end; movetoXY
z_pos = z_range_start; movetoXY