function scr_player_freefall()
{
	hsp = 0;
	landAnim = 1;
	move = key_left + key_right;

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = move * movespeed;

	if (move != 0)
	    xscale = move;

	if (move != 0)
	{
	    if (movespeed < 4)
	        movespeed += 0.5;
	    else if (floor(movespeed) == 4)
	        movespeed = 4;
	}
	else
	{
	    movespeed = 0;
	}

	if (falldamage < 5)
	    falldamage += 0.35;

	if (falldamage > 5)
	    falldamage = 5;

	if (character == "V")
	    falldamage = 5;

	if (falldamage == 5)
	{
	    if (!instance_exists(obj_superslameffect))
	        instance_create(x, y, obj_superslameffect);
	}

	if (movespeed > 4)
	    movespeed = 4;

	if (character == "V")
	    sprite_index = spr_playerV_bodyslam;

	if (character == "M")
	    sprite_index = spr_pepperman_groundpound;

	if (character == "P")
	    sprite_index = spr_player_bodyslamfall;

	if (character == "N")
	    sprite_index = spr_playerN_noisecrusherfall;

	if (vsp < 15)
	    vsp++;

	if (grounded && !place_meeting(x, y + 1, obj_slope) && !(input_buffer_jump < 8))
	{
	    scr_sound(sound_maximumspeedland);
	    image_index = 0;
	    state = states.freefallland;
	    jumpAnim = 1;
	    jumpstop = 0;
    
	    with (obj_baddie)
	    {
	        if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	        {
	            vsp = -7;
	            hsp = 0;
	        }
	    }
    
	    with (obj_camera)
	    {
	        shake_mag = 10;
	        shake_mag_acc = 30 / room_speed;
	    }
    
	    combo = 0;
	    bounce = 0;
	    instance_create(x, y, obj_landcloud);
	    freefallstart = 0;
	}

	if (grounded && place_meeting(x, y + 1, obj_slope) && !(input_buffer_jump < 8))
	{
	    movespeed = 12;
	    image_index = 0;
	    mach2 = 100;
	    state = states.machroll;
	    jumpAnim = 1;
	    jumpstop = 0;
	    bounce = 0;
	    instance_create(x, y, obj_landcloud);
	    freefallstart = 0;
	}

	image_speed = 0.35;
}