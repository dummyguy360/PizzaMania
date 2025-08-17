function scr_player_climbwall()
{
	if (character != "N")
	{
	    if (windingAnim < 200)
	        windingAnim++;
    
	    suplexmove = 0;
	    vsp = -wallspeed;
    
	    if (wallspeed < 12)
	        wallspeed += 0.25;
    
	    crouchslideAnim = 1;
    
	    if (character != "P")
	        sprite_index = spr_climbwall;
    
	    if (character == "P")
	    {
	        if (wallspeed < 4)
	            sprite_index = spr_player_clingwall;
        
	        if (wallspeed > 4)
	            sprite_index = spr_climbwall;
	    }
    
	    if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
	    {
	        scr_sound(sound_maximumspeedland);
        
	        with (obj_camera)
	        {
	            shake_mag = 10;
	            shake_mag_acc = 30 / room_speed;
	        }
        
	        with (obj_baddie)
	        {
	            if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	            {
	                image_index = 0;
	                state = states.idle;
	                vsp = -7;
	                hsp = 0;
	            }
	        }
        
	        image_index = 0;
	        state = states.Sjumpland;
	        machhitAnim = 0;
	        sprite_index = spr_Sjumpland;
	    }
    
	    if (!key_attack)
	    {
	        state = states.jump;
	        sprite_index = spr_fall;
	    }
    
	    if (!scr_solid(x + xscale, y))
	    {
	        instance_create(x, y, obj_jumpdust);
	        vsp = 0;
        
	        if (mach2 < 100)
	            state = states.mach2;
	        else
	        {
	            movespeed = 12;
	            state = states.mach3;
	            sprite_index = spr_mach4;
	            image_speed = 0.35;
	        }
	    }
    
	    if (place_meeting(x + 1, y, obj_destructibles) || place_meeting(x + 1, y, obj_destructibles))
	    {
	        if (mach2 < 100)
	            state = states.mach2;
	        else
	        {
	            state = states.mach3;
	            sprite_index = spr_mach4;
	            image_speed = 0.35;
	        }
	    }
    
	    if ((grounded && wallspeed <= 0) || wallspeed <= 0)
	    {
	        state = states.jump;
	        sprite_index = spr_fall;
	    }
    
	    image_speed = 0.6;
    
	    if (!instance_exists(obj_cloudeffect))
	        instance_create(x, y + 43, obj_cloudeffect);
    
	    if (key_jump && key_attack)
	    {
	        instance_create(x, y, obj_jumpdust);
	        vsp = -9;
	        xscale *= -1;
	        mach2 = 50;
	        movespeed = 8;
	        state = states.mach2;
	    }
	}
	else
	{
	    if (dir != 0)
	    {
	        xscale = -xscale;
	        dir = 0;
	    }
    
	    image_speed = 0.35;
	    vsp = 0;
    
	    if (tauntstoredsprite != spr_playerN_wallcling)
	        sprite_index = spr_playerN_wallclingstart;
    
	    if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
	    {
	        image_index = 0;
	        sprite_index = spr_playerN_wallcling;
	        tauntstoredsprite = spr_playerN_wallcling;
	    }
    
	    if (sprite_index == spr_playerN_wallcling && floor(image_index) == (image_number - 1))
	    {
	        tauntstoredsprite = spr_null;
	        dir = xscale;
	        flash = 1;
	        vsp = -9;
	        movespeed = 10;
	        image_index = 0;
	        sprite_index = spr_mach2jump;
	        state = states.mach2;
	    }
    
	    if (key_jump)
	    {
	        tauntstoredsprite = spr_null;
	        dir = xscale;
	        flash = 1;
	        vsp = -9;
	        movespeed = 10;
	        image_index = 0;
	        sprite_index = spr_mach2jump;
	        state = states.mach2;
	    }
    
	    if (!scr_solid(x + 1, y) && !scr_solid(x - 1, y))
	    {
	        tauntstoredsprite = spr_null;
	        dir = xscale;
	        vsp = -6;
	        image_index = 0;
	        movespeed = 10;
	        sprite_index = spr_mach2jump;
	        state = states.mach2;
	    }
    
	    if (place_meeting(x + 1, y, obj_destructibles) || place_meeting(x + 1, y, obj_destructibles))
	    {
	        tauntstoredsprite = spr_null;
	        dir = xscale;
        
	        if (mach2 < 100)
	            state = states.mach2;
	        else
	        {
	            state = states.mach3;
	            sprite_index = spr_mach4;
	            image_speed = 0.35;
	        }
	    }
	}
}