function scr_player_handstandjump()
{
	if (handstand == 0)
	{
	    landAnim = false;
	    hsp = xscale * movespeed;
	    momemtum = true;
	    dir = xscale;
	    move = key_right + key_left;
	    move2 = key_right2 + key_left2;
    
	    if (sprite_index != spr_crouchslip && grounded && sprite_index != spr_suplexgrabjump)
	        sprite_index = spr_suplexdash;
    
	    if (!grounded && sprite_index == spr_suplexdash)
	    {
	        image_index = 0;
	        sprite_index = spr_suplexgrabjumpstart;
	    }
    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexgrabjumpstart)
	        sprite_index = spr_suplexgrabjump;
    
	    if (movespeed < 10)
	        movespeed += 1;
    
	    if (floor(image_index) == (image_number - 1) && move != 0)
	    {
	        state = states.mach2;
	        mach2 = 35;
	        grav = 0.5;
	    }
    
	    if (grounded && (sprite_index == spr_suplexgrabjumpstart || sprite_index == spr_suplexgrabjump))
	    {
	        movespeed = 10;
	        state = states.mach2;
	        mach2 = 35;
	        grav = 0.5;
	    }
    
	    if (floor(image_index) == (image_number - 1) && move == 0)
	    {
	        state = states.normal;
	        grav = 0.5;
	    }
    
	    if (key_down && (grounded || character == "N"))
	    {
	        grav = 0.5;
	        sprite_index = spr_crouchslip;
        
	        if (character == "P")
	            machhitAnim = false;
        
	        state = states.crouchslide;
	    }
    
	    if (!grounded && scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	    {
	        wallspeed = 0;
	        image_index = 0;
	        machhitAnim = false;
	        state = states.climbwall;
	    }
	    else if (!grounded && scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	    {
	        wallspeed = 0;
	        image_index = 0;
	        machhitAnim = false;
	        state = states.climbwall;
	    }
    
	    if (grounded && scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	    {
	        grav = 0.5;
	        movespeed = 0;
	        state = states.bump;
	        hsp = -2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        machslideAnim = true;
	        machhitAnim = false;
	        instance_create(x + 10, y + 10, obj_bumpeffect);
	    }
    
	    if (grounded && scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	    {
	        grav = 0.5;
	        movespeed = 0;
	        state = states.bump;
	        hsp = 2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        machslideAnim = true;
	        machhitAnim = false;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (key_jump && grounded && character == "P")
	    {
	        movespeed = 10;
	        sprite_index = spr_mach2jump;
	        instance_create(x, y, obj_jumpdust);
	        state = states.mach2;
	        vsp = -9;
	    }
	    else if (key_jump && character == "N")
	    {
	        movespeed = 10;
	        sprite_index = spr_mach2jump;
	        instance_create(x, y, obj_jumpdust);
	        state = states.mach2;
	        vsp = -9;
	    }
    
	    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	        instance_create(x, y, obj_slidecloud);
    
	    image_speed = 0.4;
    
	    if (character != "V")
	    {
	        if (state != states.bump && hsp != 0 && key_slap2)
	        {
	            image_index = 0;
	            image_speed = 0.8;
	            sprite_index = spr_chainsawstart;
	            grav = 0.5;
	            flash = false;
	            state = states.chainsaw;
	        }
        
	        if (state != states.bump && hsp != 0 && move == -1 && xscale == 1)
	        {
	            image_index = 0;
	            image_speed = 0.8;
            
	            if (!grounded)
	            {
	                sprite_index = spr_suplexcancel;
	                jumpAnim = false;
	                fallAnim = 0;
	                mach2 = 0;
	                movespeed = 0;
	                grav = 0.5;
	                state = states.jump;
	            }
	            else
	            {
	                state = states.normal;
	                grav = 0.5;
	                movespeed = 7;
	            }
	        }
        
	        if (state != states.bump && hsp != 0 && move == 1 && xscale == -1)
	        {
	            image_index = 0;
	            image_speed = 0.8;
            
	            if (!grounded)
	            {
	                sprite_index = spr_suplexcancel;
	                jumpAnim = true;
	                mach2 = 0;
	                movespeed = 0;
	                grav = 0.5;
	                state = states.jump;
	            }
	            else
	            {
	                state = states.normal;
	                grav = 0.5;
	                movespeed = 7;
	            }
	        }
	    }
	}

	if (handstand == 1)
	{
	    landAnim = false;
	    hsp = xscale * movespeed;
	    momemtum = true;
	    dir = xscale;
	    move = key_right + key_left;
	    move2 = key_right2 + key_left2;
	    sprite_index = spr_player_hanstandjump;
    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_hanstandjump && !grounded)
	    {
	        state = states.machfreefall;
	        movespeed = 0;
	    }
    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_hanstandjump && grounded)
	    {
	        state = states.normal;
	        handstand = 0;
	        movespeed = 0;
	    }
    
	    if (grounded && floor(image_index) == 3)
	    {
	        scr_sound(sound_jump);
	        vsp = -6;
	    }
    
	    if (!grounded)
	        movespeed = 9;
    
	    if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + 1, y, obj_destructibles))
	    {
	        xscale = -xscale;
	        vsp = -6;
	        state = states.handstandjump;
	        image_index = 4;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - 1, y, obj_destructibles))
	    {
	        xscale = -xscale;
	        vsp = -6;
	        state = states.handstandjump;
	        image_index = 4;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
    
	    if (key_slap2 && state != states.bump && hsp != 0)
	    {
	        image_index = 0;
	        image_speed = 0.8;
        
	        if (!grounded)
	        {
	            sprite_index = spr_suplexcancel;
	            jumpAnim = false;
	            fallAnim = 0;
	            mach2 = 0;
	            movespeed = 0;
	            grav = 0.5;
	            state = states.jump;
	        }
	    }
	}

	if (handstand == 2)
	{
	    image_speed = 0.5;
	    hsp = xscale * movespeed;
	    momemtum = true;
	    dir = xscale;
    
	    if (sprite_index == spr_Sjumpcancelstart && floor(image_index) == (image_number - 1))
	    {
	        movespeed = 8;
	        vsp = -2;
	        sprite_index = spr_Sjumpcancel;
	    }
    
	    if (sprite_index == spr_Sjumpcancel)
	    {
	        if (movespeed < 12)
	            movespeed += 1;
        
	        if (grounded)
	        {
	            handstand = 0;
	            image_index = 0;
            
	            if (character == "P")
	                sprite_index = spr_player_rollgetup;
            
	            if (character == "N")
	                sprite_index = spr_playerN_rollgetup;
            
	            machhitAnim = true;
	            state = states.mach2;
	            mach2 = 75;
	        }
        
	        if (!grounded && scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + 1, y, obj_destructibles))
	        {
	            handstand = 0;
	            wallspeed = 6;
	            machhitAnim = false;
	            state = states.climbwall;
	        }
	        else if (!grounded && scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - 1, y, obj_destructibles))
	        {
	            handstand = 0;
	            wallspeed = 6;
	            machhitAnim = false;
	            state = states.climbwall;
	        }
	    }
	}
}