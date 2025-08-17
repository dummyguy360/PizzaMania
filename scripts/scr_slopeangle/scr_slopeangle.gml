function scr_slopeangle()
{
	var checkside = -1;
	var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
	array0 = y;
	array1 = y;

	for (var i = 0; i < 2; i++)
	{
	    var ay = y;
    
	    for (var top = -3; top < height; top++)
	    {
	        var check_1 = scr_solid_player(x + (1 * checkside), y + top);
	        var check_2 = !scr_solid_player(x + (1 * checkside), (y + top) - 1);
        
	        if (check_1 && check_2)
	        {
	            ay = (y + top) - 1;
	            break;
	        }
	    }
    
	    if (i == 0)
	        array0 = ay;
	    else
	        array1 = ay;
    
	    checkside = -checkside;
	}

	var pointer1 = array0;
	var pointer2 = array1;
	var _angle = 0;

	if (pointer1 != pointer2)
	    _angle = point_direction(x - 1, pointer1, x + 1, pointer2);

	return _angle;
}