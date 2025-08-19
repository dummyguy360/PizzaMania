function scr_player_mach2()
{
	if (character != "M")
	{
	    if (character == "P")
	    {
	        if (windingAnim < 2000)
	            windingAnim++;
	    }
    
	    if (movespeed < 8)
	        movespeed = 8;
    
	    if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	        hsp = xscale * movespeed;
	    else if (place_meeting(x, y + 1, obj_railh))
	        hsp = (xscale * movespeed) - 5;
	    else if (place_meeting(x, y + 1, obj_railh2))
	        hsp = (xscale * movespeed) + 5;
    
	    move2 = key_right2 + key_left2;
	    move = key_right + key_left;
	    crouchslideAnim = true;
    
	    if (!key_jump2 && jumpstop == false && vsp < 0.5)
	    {
	        vsp /= 2;
	        jumpstop = true;
	    }
    
	    if (movespeed < 12 && move != 0)
	        movespeed += 0.1;
    
	    if (movespeed > 12)
	        movespeed -= 0.1;
    
	    if (grounded && vsp > 0)
	        jumpstop = false;
    
	    if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && key_attack)
	    {
	        image_index = 0;
        
	        if (gliding == 0)
	            sprite_index = spr_secondjump1;
        
	        scr_sound(sound_jump);
	        vsp = -9;
	    }
    
	    if (key_jump && !grounded && sprite_index == spr_dive)
	    {
	        image_index = 0;
	        vsp = -6;
	        scr_sound(sound_groundpoundstart);
	        state = states.freefallprep;
	    }
    
	    if (grounded)
	    {
	        airtaunt = 0;
        
	        if (machpunchAnim == false && sprite_index != spr_mach && sprite_index != spr_player_mach3 && sprite_index != spr_player_rollgetup && sprite_index != spr_playerN_rollgetup)
	        {
	            if (sprite_index != spr_player_rollgetup && sprite_index != spr_playerN_rollgetup && sprite_index != spr_playerV_mach1)
	                sprite_index = spr_mach;
	        }
        
	        var roll = sprite_index == spr_player_rollgetup || sprite_index == spr_playerN_rollgetup;
	        var frame_threshold = image_number - 1;
        
	        if (roll)
	        {
	            if (image_index >= frame_threshold && prev_index < frame_threshold)
	                sprite_index = spr_mach;
	        }
        
	        if (machpunchAnim == true)
	        {
	            if (punch == false)
	                sprite_index = spr_machpunch1;
            
	            if (punch == true)
	                sprite_index = spr_machpunch2;
            
	            if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
	            {
	                punch = true;
	                machpunchAnim = false;
	            }
            
	            if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
	            {
	                punch = false;
	                machpunchAnim = false;
	            }
	        }
	    }
    
	    if (!grounded)
	        machpunchAnim = false;
    
	    if (key_down && !key_jump && !grounded && !place_meeting(x, y, obj_dashpad) && character != "V" && movespeed > 8)
	    {
	        flash = false;
	        vsp = 15;
	        image_index = 0;
	        sprite_index = spr_dive;
	    }
    
	    if (key_down && !key_jump && !grounded && !place_meeting(x, y, obj_dashpad) && character == "V" && movespeed > 8)
	    {
	        flash = false;
	        vsp = 15;
	        image_index = 0;
	        sprite_index = spr_dive;
	    }
    
	    if (grounded)
	    {
	        if (mach2 < 100)
	        {
	            if (character != "N")
	                mach2 += 1.5;
            
	            if (character == "N")
	                mach2 += 2;
	        }
        
	        if (mach2 >= 100)
	        {
	            machhitAnim = false;
	            state = states.mach3;
	            flash = true;
	            sprite_index = spr_mach4;
	            instance_create(x, y, obj_jumpdust);
            
	            if (movespeed < 12)
	                movespeed = 12;
	        }
	    }
    
	    if (key_jump)
	        input_buffer_jump = 0;
    
	    if (!key_attack && grounded)
	    {
	        scr_sound(sound_maximumspeedstop);
	        image_index = 0;
	        sprite_index = spr_machslidestart;
	        state = states.machslide;
	        mach2 = 0;
	    }
    
	    if (move == -1 && xscale == 1 && grounded)
	    {
	        scr_sound(sound_machslide);
	        sprite_index = spr_machslideboost;
	        state = states.machslide;
	        image_index = 0;
	        mach2 = 35;
	    }
    
	    if (move == 1 && xscale == -1 && grounded)
	    {
	        scr_sound(sound_machslide);
	        sprite_index = spr_machslideboost;
	        state = states.machslide;
	        image_index = 0;
	        mach2 = 35;
	    }
    
	    if (key_down && grounded)
	    {
	        sprite_index = spr_crouchslip;
        
	        if (character == "P")
	            machhitAnim = false;
        
	        state = states.crouchslide;
	    }
    
	    if (grounded && !scr_slope() && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && xscale == -1)
	    {
	        scr_sound(sound_suplex1);
	        state = states.bump;
	        hsp = 2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (grounded && !scr_slope() && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && xscale == 1)
	    {
	        scr_sound(sound_suplex1);
	        state = states.bump;
	        hsp = -2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (character == "N")
	    {
	        if (!grounded)
	        {
	            if (sprite_index == spr_dive && scr_solid(x + 1, y) && ((xscale == 1 && scr_slope(x + hsp, y)) || scr_solid(x + hsp, y)) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(bbox_right + 1, y, obj_destructibles))
	            {
	                xscale = -xscale;
	                image_index = 0;
	                machhitAnim = false;
	            }
	            else if (sprite_index == spr_dive && scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(bbox_left - 1, y, obj_destructibles))
	            {
	                xscale = -xscale;
	                image_index = 0;
	                machhitAnim = false;
	            }
	        }
	    }
    
	    if (((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope))) && sprite_index != spr_dive)
	    {
	        wallspeed = 6;
	        state = states.climbwall;
	    }
    
	    if (!instance_exists(obj_dashcloud) && grounded)
	        instance_create(x, y, obj_dashcloud);
    
	    if (!key_down)
	    {
	        if (!grounded && sprite_index != spr_secondjump2 && sprite_index != spr_mach2jump)
	        {
	            if (gliding == 0)
	                sprite_index = spr_secondjump1;
	        }
        
	        if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
	        {
	            if (gliding == 0)
	                sprite_index = spr_secondjump2;
	        }
	    }
    
	    if (key_slap2 && !key_up && !key_down && suplexmove == false && character != "M" && character != "V")
	    {
	        instance_create(x, y, obj_slaphitbox);
	        suplexmove = true;
	        vsp = 0;
	        instance_create(x, y, obj_jumpdust);
	        image_index = 0;
	        sprite_index = spr_suplexdash;
	        state = states.handstandjump;
	    }
    
	    if (key_up && key_slap2 && suplexmove == false && shotgunAnim == false && character == "P")
	    {
	        instance_create(x, y, obj_slaphitbox);
	        suplexmove = true;
	        handstand = 1;
	        vsp = 0;
	        instance_create(x, y, obj_jumpdust);
	        image_index = 0;
	        image_index = 4;
	        sprite_index = spr_player_hanstandjump;
	        state = states.handstandjump;
	        vsp = -5;
	    }
    
	    if (key_up && key_slap2 && character == "N" && movespeed != 0)
	    {
	        var sounds = [va_noise_woag, va_noise_wawaoh, va_noise_waow];
	        scr_sound(sounds[irandom(array_length_1d(sounds) - 1)]);
	        landAnim = false;
	        image_index = 0;
	        sprite_index = spr_playerN_pogostart;
	        vsp = -6;
	        flash = true;
	        state = states.machfreefall;
	    }
    
	    if (key_slap && character == "V")
	    {
	        vsp = -4;
	        global.was_grounded = 1;
	        handstand = 0;
        
	        if (grounded)
	            sprite_index = spr_playerV_revolvershoot;
	        else
	            sprite_index = spr_playerV_airrevolver;
        
	        scr_sound(sound_pistolshot);
	        state = states.pistol;
	        image_index = 0;
	        shoot = true;
	    }
    
	    if (key_slap && key_up && character == "V")
	    {
	        vsp = -4;
	        global.was_grounded = 1;
	        handstand = 1;
	        sprite_index = spr_playerV_dynamitethrow;
	        state = states.pistol;
	        image_index = 0;
	        shoot = true;
	    }
    
	    image_speed = 0.65;
    
	    if (key_taunt && airtaunt == 0 && state != states.machslide)
	    {
	        airtaunt = 1;
	        taunttimer = 20;
	        tauntstoredmovespeed = movespeed;
	        tauntstoredsprite = sprite_index;
	        tauntstoredstate = state;
	        state = states.backbreaker;
	        image_index = random_range(0, 7);
	        sprite_index = spr_taunt;
	        instance_create(x, y, obj_taunteffect);
	    }
    
	    if (sprite_index == spr_playerV_bootsjump && floor(image_index) == (image_number - 1))
	        sprite_index = spr_playerV_bootsfall;
    
	    if (sprite_index == spr_playerV_mach1 && floor(image_index) == (image_number - 1))
	        sprite_index = spr_mach;
	}
	else
	{
	    image_index = 0;
	    sprite_index = spr_mach4;
	    movespeed = 12;
	    state = states.mach3;
	    mach2 = 100;
	}
}