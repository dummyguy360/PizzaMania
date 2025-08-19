function scr_player_knightpep()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hurted = true;

	if (sprite_index == spr_knightpepwalk || sprite_index == spr_knightpepjump || sprite_index == spr_knightpepfall || sprite_index == spr_knightpepidle)
	{
	    move = key_left + key_right;
	    hsp = move * movespeed;
	}
	else
	{
	    hsp = 0;
	    move = 0;
	}

	if (key_jump)
	    input_buffer_jump = 0;

	if (!key_jump2 && jumpstop == false && vsp < 0.5 && stompAnim == false)
	{
	    vsp /= 2;
	    jumpstop = true;
	}

	if (grounded && vsp > 0)
	    jumpstop = false;

	if (((sprite_index == spr_knightpepidle || sprite_index == spr_knightpepwalk) && key_slap2) && character != "N")
	{
	    scr_sound(sound_swordswing);
	    instance_create(x, y, obj_swordhitbox);
	    instance_create(x + (-xscale * 10), y, obj_slidecloud);
	    sprite_index = spr_knightpep_attack;
	    image_index = 0;
	    state = states.knightpepattack;
	}

	if (dir != xscale)
	{
	    dir = xscale;
	    movespeed = 0;
	}

	if (grounded && move != 0 && sprite_index == spr_knightpepidle)
	    sprite_index = spr_knightpepwalk;
	else if (grounded && move == 0 && sprite_index == spr_knightpepwalk)
	    sprite_index = spr_knightpepidle;

	if (input_buffer_jump < 8 && vsp > 0 && grounded && (sprite_index == spr_knightpepidle || sprite_index == spr_knightpepwalk))
	{
	    scr_sound(sound_jump);
	    image_index = 0;
	    sprite_index = spr_knightpepjumpstart;
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjumpstart)
	{
	    vsp = -11;
	    sprite_index = spr_knightpepjump;
	}

	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjump) || (!grounded && sprite_index != spr_knightpepjump))
	    sprite_index = spr_knightpepfall;

	if (sprite_index == spr_knightpepfall && grounded)
	{
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
	    bounce = false;
	    image_index = 0;
	    freefallstart = 0;
	    momemtum = false;
	    scr_sound(sound_maximumspeedland);
	    instance_create(x, y, obj_landcloud);
	    sprite_index = spr_knightpepland;
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepland)
	    sprite_index = spr_knightpepidle;

	if (move != 0)
	    xscale = move;

	if (move != 0)
	{
	    if (movespeed < 6)
	        movespeed += 0.5;
	    else if (movespeed == 6)
	        movespeed = 6;
	}
	else
	    movespeed = 0;

	if (move != 0)
	{
	    if (movespeed < 1)
	        image_speed = 0.15;
	    else if (movespeed > 1 && movespeed < 4)
	        image_speed = 0.35;
	    else
	        image_speed = 0.6;
	}
	else
	    image_speed = 0.35;

	if (floor(image_index) == 4 && sprite_index == spr_knightpep_start)
	    instance_create(x, y - 600, obj_thunder);

	if (floor(image_index) == 3 && sprite_index == spr_playerN_knightsword)
	{
	    if (!instance_exists(obj_thunder))
	        instance_create(x, y - 600, obj_thunder);
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_thunder)
	    sprite_index = spr_knightpepidle;

	if (floor(image_index) == 19 && sprite_index == spr_playerN_knightstart)
	    sprite_index = spr_knightpepidle;

	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
	    instance_create(x, y + 43, obj_cloudeffect);

	if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == false)
	{
	    scr_sound(sound_step);
	    steppy = true;
	}

	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
	    steppy = false;

	if (scr_slope(x + sign(hsp), y + 1))
	{
	    sprite_index = spr_knightpepdownslope;
	    state = states.knightpepslopes;
	}
}