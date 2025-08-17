function scr_solid_slope(argument0, argument1)
{
	old_x = x;
	old_y = y;
	x = argument0;
	y = argument1;

	if (check_slope(obj_slope))
	{
	    var inst = instance_place(x, y, obj_slope);
    
	    if (sign(inst.image_xscale) != xscale)
	    {
	        x = old_x;
	        y = old_y;
	        return true;
	    }
	}

	x = old_x;
	y = old_y;
	return false;
}