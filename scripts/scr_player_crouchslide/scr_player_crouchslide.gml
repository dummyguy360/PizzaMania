function scr_player_crouchslide()
{
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;

	if (movespeed >= 0 && sprite_index != spr_dive)
	    movespeed -= 0.2;

	mask_index = spr_crouchmask;

	if (movespeed < 0)
	    movespeed = 0;

	if (movespeed == 0 && character == "M")
	    state = 0;

	if (key_jump && character == "M" && sprite_index != spr_dive)
	{
	    scr_sound(sound_jump);
    
	    if (instance_exists(obj_highjumpcloud1))
	        instance_create(x, y, obj_highjumpcloud1);
    
	    flash = 1;
	    vsp = -15;
	    global.was_grounded = 1;
	    image_index = 0;
	    sprite_index = spr_pepperman_rolling;
	    state = states.chainsawpogo;
	}

	if (character == "M" && !grounded && key_jump && global.was_grounded == 0 && sprite_index == spr_dive)
	{
	    scr_sound(sound_groundpoundstart);
	    image_index = 0;
	    sprite_index = spr_pepperman_groundpoundstart;
	    vsp = -6;
	    state = states.chainsawpogo;
	}

	if (!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16) && key_attack && sprite_index != spr_player_shootslide)
	{
	    image_index = 0;
    
	    if (character == "P")
	        sprite_index = spr_player_rollgetup;
    
	    if (character == "N")
	        sprite_index = spr_playerN_rollgetup;
    
	    if (character == "N")
	        machhitAnim = 1;
    
	    if (character != "M")
	    {
	        mach2 = 35;
	        state = states.mach2;
	        movespeed = 10;
	    }
    
	    if (character == "M")
	    {
	        sprite_index = spr_mach4;
	        flash = 0;
	        mach2 = 100;
	        state = states.mach3;
	        movespeed = 12;
	    }
	}

	if (key_down && !key_jump && !grounded && !place_meeting(x, y, obj_dashpad))
	{
	    flash = 0;
	    vsp = 15;
	    sprite_index = spr_dive;
	}

	if (grounded && key_down && sprite_index != spr_pepperman_rolling)
	    sprite_index = spr_crouchslip;

	if (((hsp == 0 || (scr_solid(x + 1, y) && xscale == 1) || (scr_solid(x - 1, y) && xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope)) || (movespeed <= 0 && character != "M"))
	{
	    state = states.crouch;
	    movespeed = 0;
	    mach2 = 0;
	    crouchslideAnim = 1;
	    image_index = 0;
	    crouchAnim = 1;
	    start_running = 1;
	    alarm[4] = 14;
	}

	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    movespeed = 0;
	    state = states.bump;
	    hsp = -2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
    
	    if (character != "M")
	        machslideAnim = 1;
	    else
	        machslideAnim = 0;
    
	    machhitAnim = 0;
	    instance_create(x + 10, y + 10, obj_bumpeffect);
	}

	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    movespeed = 0;
	    state = states.bump;
	    hsp = 2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    image_index = 0;
    
	    if (character != "M")
	        machslideAnim = 1;
	    else
	        machslideAnim = 0;
    
	    machhitAnim = 0;
	    instance_create(x - 10, y + 10, obj_bumpeffect);
	}

	if (movespeed == 0 && character == "M" && mach2 < 35)
	{
	    state = states.normal;
	    sprite_index = spr_idle;
	}

	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	    instance_create(x, y, obj_slidecloud);

	image_speed = 0.35;
}