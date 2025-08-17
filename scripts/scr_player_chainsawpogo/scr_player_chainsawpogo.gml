function scr_player_chainsawpogo()
{
	if (global.chainsawcooldown == 0)
	{
	    hsp = xscale * movespeed;
    
	    if (move != 0)
	        xscale = move;
    
	    move = key_left + key_right;
    
	    if (move != 0 && movespeed < 10 && sprite_index != spr_pepperman_Sjumpprep)
	        movespeed += 0.5;
    
	    if (move == 0 && movespeed > 0)
	        movespeed -= 0.5;
    
	    if (movespeed > 0 && sprite_index == spr_pepperman_Sjumpprep)
	        movespeed -= 0.5;
    
	    if (movespeed < 0)
	        movespeed = 0;
	}

	if (movespeed > 10)
	    movespeed -= 0.5;

	if (key_down && grounded && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock) && sprite_index != spr_pepperman_rolling)
	    sprite_index = spr_pepperman_Sjumpprep;

	if (global.was_grounded == 1 && vsp > 0 && key_down && sprite_index == spr_pepperman_rolling && sprite_index != spr_pepperman_groundpoundstart && sprite_index != spr_pepperman_groundpound)
	{
	    image_index = 0;
	    sprite_index = spr_pepperman_groundpoundstart;
	    global.was_grounded = 0;
	    vsp = -6;
	}

	if (global.chainsawcooldown > 0)
	    global.chainsawcooldown -= 0.05;

	landAnim = 0;

	if (sprite_index == spr_pepperman_groundpound && !audio_is_playing(sound_groundpoundloop))
	    scr_sound(sound_groundpoundloop);

	if (sprite_index == spr_pepperman_groundpoundstart && image_index >= (image_number - 1))
	{
	    global.was_grounded = 0;
	    image_index = 0;
	    sprite_index = spr_pepperman_groundpound;
	}

	if (sprite_index == spr_pepperman_groundpound)
	    vsp += 0.5;

	if (place_meeting(x + hsp, y, obj_destructibles))
	{
	    with (instance_place(x + hsp, y, obj_destructibles))
	        instance_destroy();
	}

	if (grounded && global.was_grounded == 0 && sprite_index == spr_pepperman_Sjumpprep && !key_down && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock))
	{
	    scr_sound(sound_maximumspeedland);
	    global.was_grounded = 1;
	    vsp = -20;
	    sprite_index = spr_pepperman_rolling;
	    instance_create(x, y, obj_explosioneffect);
    
	    with (obj_camera)
	    {
	        shake_mag = 20;
	        shake_mag_acc = 40 / room_speed;
	    }
    
	    image_speed = 0.35 * vsp;
    
	    with (obj_baddie)
	    {
	        if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	        {
	            stun = 1;
	            alarm[0] = 200;
	            ministun = 0;
	            vsp = -5;
	            hsp = 0;
	        }
	    }
    
	    with (obj_pizzaball)
	    {
	        if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	        {
	            stun = 1;
	            alarm[0] = 200;
	            ministun = 0;
	            vsp = -16;
	            hsp = 0;
	        }
	    }
    
	    flash = 1;
	    combo = 0;
	}

	if (sprite_index == spr_pepperman_rolling)
	    global.was_grounded = 1;

	if ((grounded && sprite_index == spr_pepperman_rolling && global.was_grounded == 1 && flash == 0 && vsp > 0) || (grounded && !key_down && sprite_index == spr_pepperman_groundpound))
	{
	    image_index = 0;
	    sprite_index = spr_pepperman_shoulderloop;
	    mach2 = 100;
	    state = states.mach2;
	    global.was_grounded = 0;
	}

	image_speed = 0.7;

	if (ladderbuffer > 0)
	    ladderbuffer--;

	if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = -9;
	    jumpstop = 1;
	}

	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && sprite_index == spr_pepperman_rolling)
	{
	    scr_sound(sound_bumpwall);
    
	    if (sprite_index != spr_pepperman_rolling)
	        sprite_index = spr_pepperman_rolling;
    
	    if (global.was_grounded == 0)
	        global.was_grounded = 1;
    
	    global.chainsawcooldown = 0.5;
	    xscale = -xscale;
	    hsp = -8;
	    vsp = -12;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	else if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && sprite_index == spr_pepperman_rolling)
	{
	    scr_sound(sound_bumpwall);
    
	    if (sprite_index != spr_pepperman_rolling)
	        sprite_index = spr_pepperman_rolling;
    
	    if (global.was_grounded == 0)
	        global.was_grounded = 1;
    
	    global.chainsawcooldown = 0.5;
	    xscale = -xscale;
	    hsp = 8;
	    vsp = -12;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x - 10, y + 10, obj_bumpeffect);
	}

	if ((key_slap2 || key_attack2) && sprite_index != spr_pepperman_groundpoundstart && sprite_index != spr_pepperman_groundpound)
	{
	    machpunchAnim = 1;
	    sprite_index = spr_mach3hit;
	    global.was_grounded = 0;
	    movespeed = 12;
	    mach2 = 100;
	    machhitAnim = 0;
	    state = states.mach3;
	    image_index = 0;
	    instance_create_depth(x, y - 40, 0, obj_pogoeffect);
	}
}