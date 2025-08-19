function scr_player_chainsaw()
{
	chainsawcooldown = 0;
	move = key_right + key_left;
	move2 = key_right2 + key_left2;

	if (character == "N")
	{
	    if (movespeed < 10)
	        movespeed += 0.05;
	}

	if (character == "P")
	{
	    if (movespeed < 10 && move != 0 && sprite_index != spr_player_chainsawcrouch)
	        movespeed += 0.5;
    
	    if (movespeed > 1 && sprite_index == spr_player_chainsawcrouch)
	        movespeed -= 0.1;
    
	    if (movespeed > 0 && move == 0)
	        movespeed = 0;
	}

	if (character == "P" && grounded && move == 0 && sprite_index != (spr_chainsawstart || spr_chainsawend))
	    sprite_index = spr_player_chainsawend2;

	if (character == "P" && grounded && move != 0 && sprite_index != (spr_chainsawstart || spr_chainsawend) && !key_down)
	    sprite_index = spr_player_chainsaw;

	if (character == "P" && grounded && move != 0 && sprite_index != (spr_chainsawstart || spr_chainsawend) && key_down && movespeed != 0)
	    sprite_index = spr_player_chainsawcrouch;

	if (character != "P")
	{
	    if (sprite_index == spr_chainsawstart && image_index > 1)
	    {
	        sprite_index = spr_chainsaw;
	        image_index = 0;
	    }
	}

	if (character == "P")
	{
	    if (sprite_index == spr_chainsawstart && image_index > 1)
	    {
	        if (move != 0)
	            sprite_index = spr_chainsaw;
	        else
	            sprite_index = spr_player_chainsawend2;
        
	        image_index = 0;
	    }
	}

	if (movespeed > 12)
	    movespeed -= 0.01;

	if (!variable_global_exists("was_grounded"))
	    global.was_grounded = grounded;

	if (!variable_global_exists("chainsawcooldown"))
	    global.chainsawcooldown = 0;

	if (grounded && character == "N")
	{
	    with (obj_camera)
	    {
	        shake_mag = 5;
	        shake_mag_acc = 10 / room_speed;
	    }
    
	    instance_create(x, y, obj_landcloud);
    
	    with (obj_baddie)
	    {
	        if (grounded && point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	        {
	            image_index = 0;
	            state = states.idle;
	            vsp = -7;
	            hsp = 0;
	        }
	    }
	}

	landAnim = false;
	hsp = xscale * movespeed;

	if (move == -1 && xscale == 1 && global.chainsawcooldown == 0)
	{
	    if (grounded)
	        sprite_index = spr_chainsawstart;
    
	    image_index = 0;
	    xscale = -xscale;
	    global.chainsawcooldown = room_speed * 0.1;
	}

	if (move == 1 && xscale == -1 && global.chainsawcooldown == 0)
	{
	    if (grounded)
	        sprite_index = spr_chainsawstart;
    
	    image_index = 0;
	    xscale = -xscale;
	    global.chainsawcooldown = room_speed * 0.1;
	}

	if (global.chainsawcooldown > 0)
	    global.chainsawcooldown -= 1;

	if (key_slap2)
	    sprite_index = spr_chainsawend;

	if (sprite_index == spr_chainsawend)
	{
	    flash = true;
	    image_index = 0;
    
	    if (move != 0 || character == "N")
	    {
	        state = states.mach2;
        
	        if (character == "N")
	        {
	            if (!instance_exists(obj_sausageman_dead))
	            {
	                with (instance_create(x, y, obj_sausageman_dead))
	                {
	                    sprite_index = spr_washingmachine;
	                    image_xscale = obj_player.xscale;
	                    hsp = 1 * image_xscale;
	                }
	            }
	        }
        
	        movespeed = 10;
	        mach2 = 35;
	    }
    
	    if (move == 0 && character == "P")
	    {
	        state = states.normal;
	        mach2 = 0;
	    }
	}

	if (key_jump && grounded)
	{
	    scr_sound(sound_jump);
	    vsp = -9;
	}

	if (!grounded && global.was_grounded && character == "P")
	{
	    sprite_index = spr_player_chainsawair;
	    image_index = 0;
	}

	if (grounded && sprite_index == spr_player_chainsawair && character == "P")
	{
	    sprite_index = spr_chainsaw;
	    image_index = 0;
	}

	if (grounded && character == "N")
	{
	    vsp = -6;
    
	    if (!instance_exists(obj_explosioneffect))
	    {
	        scr_sound(sound_maximumspeedland);
	        instance_create(x, y, obj_explosioneffect);
	    }
	}

	if (grounded && character == "N" && key_jump2)
	{
	    vsp = -12;
    
	    if (!instance_exists(obj_explosioneffect))
	    {
	        scr_sound(sound_maximumspeedland);
	        instance_create(x, y, obj_explosioneffect);
	    }
	}

	if (!instance_exists(obj_chainsaweffect))
	    instance_create(x, y, obj_chainsaweffect);

	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_slope) && !place_meeting(x + xscale, y, obj_destructibles))
	{
	    image_index = 0;
    
	    if (character != "N")
	        instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
    
	    hsp = -xscale * 5;
	    vsp = -3;
	    state = states.chainsawbump;
    
	    if (character == "N")
	    {
	        if (!instance_exists(obj_bangeffect))
	            instance_create(x, y, obj_bangeffect);
        
	        scr_sound(sound_explosion);
        
	        if (dir == 1)
	        {
	            with (instance_create(x - 32, y - 32, obj_sausageman_dead))
	                sprite_index = spr_washingmachine;
            
	            scr_sleep(5);
	            tile_layer_delete_at(1, x, y);
	            tile_layer_delete_at(1, x + 32, y);
	            tile_layer_delete_at(1, x + 32, y + 32);
	            tile_layer_delete_at(1, x, y + 32);
	        }
        
	        if (dir == -1)
	        {
	            with (instance_create(x + 32, y - 32, obj_sausageman_dead))
	                sprite_index = spr_washingmachine;
            
	            scr_sleep(5);
	            tile_layer_delete_at(1, x, y);
	            tile_layer_delete_at(1, x - 32, y);
	            tile_layer_delete_at(1, x - 32, y - 32);
	            tile_layer_delete_at(1, x, y - 32);
	        }
	    }
	}

	image_speed = 0.5;
	global.was_grounded = grounded;
}