function scr_player_freefallprep()
{
	if (((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
	    movespeed = 0;

	start_running = 1;
	alarm[4] = 14;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	machslideAnim = true;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	move = key_left + key_right;

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = move * movespeed;

	if (move != 0)
	    xscale = move;

	if (character != "M")
	{
	    if (move != 0)
	    {
	        if (movespeed < 4)
	            movespeed += 0.5;
	        else if (floor(movespeed) == 4)
	            movespeed = 4;
	    }
	    else
	        movespeed = 0;
    
	    if (movespeed > 4)
	        movespeed--;
	}

	if (character == "M")
	{
	    if (movespeed > 4 && move != 0)
	        movespeed -= 0.5;
    
	    if (movespeed > 0 && move == 0)
	        movespeed -= 0.5;
    
	    if (move != 0)
	    {
	        if (movespeed < 4)
	            movespeed += 0.5;
	        else if (floor(movespeed) == 4)
	            movespeed = 4;
	    }
	}

	if (character == "V")
	    sprite_index = spr_playerV_bodyslamprep;

	if (character == "M")
	    sprite_index = spr_pepperman_groundpoundstart;

	if (character == "P")
	    sprite_index = spr_player_bodyslamstart;

	if (character == "N")
	    sprite_index = spr_playerN_noisecrusherstart;

	image_speed = 0.5;

	if (floor(image_index) == (image_number - 1))
	    state = states.freefall;
}