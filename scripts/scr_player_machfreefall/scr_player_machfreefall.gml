function scr_player_machfreefall()
{
	if (character != "N")
	{
	    machslideAnim = true;
	    move2 = key_right2 + key_left2;
	    move = key_right + key_left;
	    crouchslideAnim = true;
	    falldamage = 0;
	    handstand = 1;
	    hsp = xscale * movespeed;
	    sprite_index = spr_machfreefall;
    
	    if (scr_solid(x + 1, y) && !place_meeting(x + 1, y, obj_destructibles) && image_xscale == 1)
	    {
	        machhitAnim = false;
	        state = states.bump;
	        hsp = -2.5;
	        vsp = -2.5;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x + 10, y + 10, obj_bumpeffect);
	    }
	    else if (scr_solid(x - 1, y) && !place_meeting(x - 1, y, obj_destructibles) && image_xscale == -1)
	    {
	        machhitAnim = false;
	        state = states.bump;
	        hsp = 2.5;
	        vsp = -2.5;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (key_down && !grounded && handstand == 1)
	    {
	        vsp = -6;
	        image_index = 0;
	        scr_sound(sound_groundpoundstart);
	        sprite_index = spr_player_freefallprep;
	        state = states.freefallprep;
	    }
    
	    if (handstand == 1 && scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + 1, y, obj_destructibles))
	    {
	        xscale = -xscale;
	        vsp = -6;
	        state = states.handstandjump;
	        image_index = 4;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (handstand == 1 && scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - 1, y, obj_destructibles))
	    {
	        xscale = -xscale;
	        vsp = -6;
	        state = states.handstandjump;
	        image_index = 4;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (grounded && !(input_buffer_jump < 8))
	    {
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = 40 / room_speed;
	        }
        
	        bounce = false;
	        state = states.freefallland;
	        jumpstop = false;
	        image_index = 0;
        
	        with (instance_create(x, y + 35, obj_bangeffect))
	            image_xscale = obj_player.image_xscale;
        
	        instance_create(x, y, obj_landcloud);
	        freefallstart = 0;
	        audio_sound_gain(sound_destroyblock1, 0.7, 0);
	        audio_play_sound(sound_destroyblock1, 1, false);
        
	        with (obj_baddie)
	        {
	            if (point_in_rectangle(x, y, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), __view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0), __view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0)))
	            {
	                image_index = 0;
	                state = states.stun;
	                vsp = -7;
	                hsp = 0;
	                stunned = 200;
	            }
	        }
	    }
    
	    audio_sound_gain(sound_machroll, 0.7, 0);
    
	    if (!audio_is_playing(sound_machroll))
	        audio_play_sound(sound_machroll, 1, false);
    
	    if (grounded && input_buffer_jump < 8 && vsp > 0)
	    {
	        sprite_index = spr_player_hanstandjump;
	        stompAnim = false;
	        hsp = 0;
	        state = states.handstandjump;
	        jumpAnim = true;
	        jumpstop = false;
	        image_index = 0;
	        instance_create(x, y, obj_landcloud);
	        freefallstart = 0;
	    }
    
	    if (key_jump)
	        input_buffer_jump = 0;
    
	    if (character == "P")
	        image_speed = 0.5;
    
	    if (character == "N")
	        image_speed = 0.7;
	}

	if (character == "N")
	{
	    image_speed = 0.35;
	    hsp = xscale * movespeed;
	    move = key_right + key_left;
    
	    if (move != 0 && !grounded)
	    {
	        xscale = move;
        
	        if (movespeed < 10)
	            movespeed += 1;
	    }
    
	    if (move == 0)
	    {
	        if (movespeed > 0)
	            movespeed -= 1;
	    }
    
	    if (grounded)
	        movespeed = 0;
    
	    if (key_down && !grounded)
	    {
	        vsp = -6;
	        flash = true;
	        image_index = 0;
	        scr_sound(sound_groundpoundstart);
	        sprite_index = spr_playerN_bodyslamstart;
	        state = states.freefallprep;
	    }
    
	    if (key_slap2 || key_attack2)
	    {
	        flash = true;
	        sprite_index = spr_mach2jump;
	        vsp = -6;
	        state = states.mach2;
	    }
    
	    if (sprite_index == spr_playerN_pogobounce && floor(image_index) == 3)
	    {
	        if (key_jump2)
	            vsp = -14;
	        else
	            vsp = -9;
	    }
    
	    if (sprite_index == spr_playerN_pogobounce && floor(image_index) == (image_number - 1))
	        sprite_index = spr_playerN_pogofall;
    
	    if (sprite_index == spr_playerN_pogostart && floor(image_index) == (image_number - 1))
	        sprite_index = spr_playerN_pogofall;
    
	    if (grounded && sprite_index == spr_playerN_pogofall)
	    {
	        scr_sound(sound_noisepogo);
	        image_index = 0;
	        sprite_index = spr_playerN_pogobounce;
	    }
	}
}