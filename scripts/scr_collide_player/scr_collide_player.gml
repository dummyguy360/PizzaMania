function scr_collide_player()
{
	grounded = 0;
	grinding = 0;
	var temp = abs(vsp);

	if (temp > 0)
	{
	    while (1)
	    {
	        if (!scr_solid_player(x, y + sign(vsp)))
	        {
	            y += sign(vsp);
	            temp -= 1;
            
	            if (temp > 0)
	                continue;
            
	            break;
	        }
	        else
	        {
	            vsp = 0;
	            break;
	        }
	    }
	}

	temp = abs(hsp);

	if (temp > 0)
	{
	    while (1)
	    {
	        if (scr_solid_player(x + sign(hsp), y) && !scr_solid_player(x + sign(hsp), y - 1))
	            y--;
        
	        if (!scr_solid_player(x + sign(hsp), y) && !scr_solid_player(x + sign(hsp), y + 1) && scr_solid_player(x + sign(hsp), y + 2))
	            y++;
        
	        if (!scr_solid_player(x + sign(hsp), y))
	        {
	            x += sign(hsp);
	            temp -= 1;
            
	            if (temp > 0)
	                continue;
            
	            break;
	        }
	        else
	        {
	            hsp = 0;
	            break;
	        }
	    }
	}

	if (vsp < 20)
	    vsp += grav;

	grounded |= scr_solid(x, y + 1);
	grounded |= (!place_meeting(x, y, obj_platform) && place_meeting(x, y + 1, obj_platform));
	grinding = !place_meeting(x, y, obj_grindrail) && place_meeting(x, y + 1, obj_grindrail);
	grounded |= grinding;
}