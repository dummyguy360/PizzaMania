function scr_player_bump()
{
	movespeed = 0;
	mach2 = 0;
	start_running = 1;
	alarm[4] = 14;

	if (grounded && vsp > 0)
	    hsp = 0;

	if (floor(image_index) == 6 && character != "G")
	{
	    movespeed = 0;
	    state = states.normal;
	}

	if (floor(image_index) == 3 && character == "G")
	{
	    movespeed = 0;
	    state = states.normal;
	}

	if (sprite_index != spr_player_catched && sprite_index != spr_mach3hitwall)
	    sprite_index = spr_bump;

	if (character != "M")
	    image_speed = 0.35;
	else
	    image_speed = 0.7;
}