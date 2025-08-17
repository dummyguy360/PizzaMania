function scr_player_jump()
{
	if (character != "G")
	{
	    move = key_left + key_right;
    
	    if (momemtum == 0)
	        hsp = move * movespeed;
	    else
	        hsp = xscale * movespeed;
    
	    if (move != xscale && momemtum == 1 && movespeed != 0)
	        movespeed -= 0.05;
    
	    if (movespeed == 0)
	        momemtum = 0;
    
	    if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
	    {
	        movespeed = 0;
	        mach2 = 0;
	    }
    
	    if (move != 0 && movespeed < 7)
	        movespeed += 0.25;
    
	    if (movespeed > 7)
	        movespeed -= 0.05;
    
	    if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
	        movespeed = 0;
    
	    if (dir != xscale)
	    {
	        mach2 = 0;
	        dir = xscale;
	        movespeed = 0;
	    }
    
	    if (move == -xscale)
	    {
	        mach2 = 0;
	        movespeed = 0;
	        momemtum = 0;
	    }
    
	    if (character != "M")
	        landAnim = 1;
    
	    if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	    {
	        vsp /= 5;
	        jumpstop = 1;
	    }
    
	    if (ladderbuffer > 0)
	        ladderbuffer--;
    
	    if (key_down && !grounded && character != "M")
	    {
	        image_index = 0;
	        vsp = -6;
	        scr_sound(sound_groundpoundstart);
	        state = states.freefallprep;
	    }
    
	    if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
	    {
	        vsp = grav;
	        jumpstop = 1;
	    }
    
	    if (key_down && !grounded && global.moveset == 1)
	    {
	        vsp = -4;
	        image_index = 0;
	        sprite_index = spr_player_freefallprep;
	        scr_sound(sound_groundpoundstart);
	        state = states.freefallprep;
	    }
    
	    if (key_up && key_slap2 && character == "N" && (sprite_index == spr_jump || sprite_index == spr_fall))
	    {
	        var sounds = [va_noise_woag, va_noise_wawaoh, va_noise_waow];
	        scr_sound(sounds[irandom(array_length_1d(sounds) - 1)]);
	        flash = 1;
	        vsp = -6;
	        image_index = 0;
	        sprite_index = spr_playerN_pogostart;
	        state = states.machfreefall;
	    }
    
	    if (grounded && input_buffer_jump < 8 && !key_down && !key_attack && vsp > 0 && !(sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))
	    {
	        scr_sound(sound_jump);
	        sprite_index = spr_jump;
        
	        if (shotgunAnim == 1)
	            sprite_index = spr_shotgun_jump;
        
	        instance_create(x, y, obj_highjumpcloud2);
	        stompAnim = 0;
	        vsp = -11;
	        state = states.jump;
	        jumpAnim = 1;
	        jumpstop = 0;
	        image_index = 0;
	        freefallstart = 0;
	    }
    
	    if (key_attack && grounded && fallinganimation < 40 && global.moveset != 1)
	    {
	        mach2 = 0;
	        movespeed = 0;
	        sprite_index = spr_mach1;
	        jumpAnim = 1;
	        state = states.mach1;
	        image_index = 0;
	    }
    
	    if (key_attack && grounded && fallinganimation < 40 && global.moveset == 1)
	    {
	        mach2 = 100;
	        movespeed = 10;
	        sprite_index = spr_mach4;
	        jumpAnim = 0;
	        state = states.mach3;
	        image_index = 0;
	    }
    
	    if (!grounded && key_jump && global.moveset == 1)
	    {
	        vsp = -8;
	        scr_sound(sound_jump);
	        instance_create(x, y, obj_shotgunjumpeffect);
	        state = states.machfreefall;
	    }
    
	    if (grounded && vsp > 0 && !key_attack)
	    {
	        if (key_attack)
	            landAnim = 0;
        
	        input_buffer_secondjump = 0;
	        airtaunt = 0;
	        state = states.normal;
	        jumpAnim = 1;
	        jumpstop = 0;
	        image_index = 0;
	        freefallstart = 0;
	    }
    
	    if (grounded && (sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))
	    {
	        scr_sound(sound_maximumspeedland);
        
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
        
	        image_index = 0;
	        state = states.freefallland;
	    }
    
	    if (key_jump)
	        input_buffer_jump = 0;
    
	    if (character == "P")
	    {
	        if (vsp > 5)
	            fallinganimation++;
        
	        if (fallinganimation >= 40 && fallinganimation < 80)
	            sprite_index = spr_player_facestomp;
        
	        if (fallinganimation >= 80)
	            sprite_index = spr_player_freefall;
	    }
    
	    if (stompAnim == 0)
	    {
	        if (jumpAnim == 1)
	        {
	            if (floor(image_index) == (image_number - 1))
	                jumpAnim = 0;
	        }
        
	        if (jumpAnim == 0)
	        {
	            if (sprite_index == spr_airdash1)
	                sprite_index = spr_airdash2;
            
	            if (sprite_index == spr_shotgun_jump)
	                sprite_index = spr_shotgun_fall;
            
	            if (sprite_index == spr_jump)
	                sprite_index = spr_fall;
            
	            if (sprite_index == spr_player_Sjumpstart)
	                sprite_index = spr_player_Sjump;
            
	            if (sprite_index == spr_player_shotgunjump1)
	                sprite_index = spr_player_shotgunjump2;
            
	            if (sprite_index == spr_shotgun_shootair)
	                image_index = 7;
	        }
	    }
    
	    if (stompAnim == 1)
	    {
	        if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
	            sprite_index = spr_stomp;
	    }
    
	    if (key_attack && sprite_index != spr_airdash2 && sprite_index != spr_airdash1 && fallinganimation < 40 && global.moveset != 1)
	    {
	        stompAnim = 0;
	        sprite_index = spr_airdash1;
	        image_index = 0;
	    }
    
	    if (key_slap && character == "V")
	    {
	        vsp = -4;
	        hsp = 4 * -xscale;
	        global.was_grounded = 1;
	        sprite_index = spr_playerV_airrevolver;
	        scr_sound(sound_pistolshot);
	        state = states.pistol;
	        handstand = 0;
	        image_index = 0;
	        shoot = 1;
	    }
    
	    if (key_slap && key_up && character == "V")
	    {
	        vsp = -4;
	        hsp = 4 * -xscale;
	        global.was_grounded = 1;
	        sprite_index = spr_playerV_dynamitethrow;
	        state = states.pistol;
	        handstand = 1;
	        image_index = 0;
	        shoot = 1;
	    }
    
	    if (key_slap2 && shotgunAnim == 1 && global.ammo > 0)
	    {
	        global.ammo -= 1;
	        instance_create(x, y + 80, obj_shotgunbulletdown);
	        vsp -= 11;
	        sprite_index = spr_player_shotgunjump1;
	        state = states.shotgun;
	        image_index = 0;
	    }
    
	    if (move != 0)
	        xscale = move;
    
	    if (character != "M")
	    {
	        if (sprite_index != spr_suplexcancel)
	            image_speed = 0.35;
	        else
	            image_speed = 0.7;
	    }
	    else
	    {
	        image_speed = 0.7;
	    }
    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexcancel)
	        sprite_index = spr_fall;
    
	    if (key_slap2 && shotgunAnim == 1 && !instance_exists(obj_cutscene_upstairs))
	    {
	        global.ammo -= 1;
	        instance_create(x, y, obj_shotgunbullet);
	        sprite_index = spr_shotgun_shootair;
	        state = states.shotgun;
	        image_index = 0;
	    }
    
	    if (!key_down && !key_up && key_slap2 && suplexmove == 0 && shotgunAnim == 0 && character != "M" && character != "V")
	    {
	        instance_create(x, y, obj_slaphitbox);
	        suplexmove = 1;
	        vsp = 0;
	        instance_create(x, y, obj_jumpdust);
	        image_index = 0;
	        sprite_index = spr_suplexdash;
	        state = states.handstandjump;
	    }
    
	    if (key_up && key_slap2 && suplexmove == 0 && shotgunAnim == 0 && character == "P")
	    {
	        instance_create(x, y, obj_slaphitbox);
	        suplexmove = 1;
	        handstand = 1;
	        vsp = 0;
	        instance_create(x, y, obj_jumpdust);
	        image_index = 0;
	        image_index = 4;
	        sprite_index = spr_player_hanstandjump;
	        state = states.handstandjump;
	        vsp = -5;
	    }
    
	    if (character == "M" && !grounded && key_down2 && global.was_grounded == 0 && sprite_index != spr_pepperman_groundpoundstart && sprite_index != spr_pepperman_groundpound)
	    {
	        scr_sound(sound_groundpoundstart);
	        image_index = 0;
	        sprite_index = spr_pepperman_groundpoundstart;
	        vsp = -6;
	        state = states.chainsawpogo;
	    }
	    else if (key_taunt && airtaunt == 0)
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
	}
	else if (character == "G")
	{
	    move = key_left + key_right;
    
	    if (momemtum == 0)
	        hsp = move * movespeed;
	    else
	        hsp = xscale * movespeed;
    
	    if (move != xscale && momemtum == 1 && movespeed != 0)
	        movespeed -= 0.05;
    
	    if (movespeed == 0)
	        momemtum = 0;
    
	    if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
	    {
	        movespeed = 0;
	        mach2 = 0;
	    }
    
	    if (move != 0 && movespeed < 7)
	        movespeed += 0.25;
    
	    if (movespeed > 7)
	        movespeed -= 0.05;
    
	    if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
	        movespeed = 0;
    
	    if (dir != xscale)
	    {
	        mach2 = 0;
	        dir = xscale;
	        movespeed = 0;
	    }
    
	    if (move == -xscale)
	    {
	        mach2 = 0;
	        movespeed = 0;
	        momemtum = 0;
	    }
    
	    if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	    {
	        vsp /= 5;
	        jumpstop = 1;
	    }
    
	    if (ladderbuffer > 0)
	        ladderbuffer--;
    
	    if (scr_solid(x, y - 1) && jumpstop == 0)
	    {
	        vsp = grav;
	        jumpstop = 1;
	    }
    
	    if (key_jump)
	        input_buffer_jump = 0;
    
	    if (move != 0)
	        sprite_index = spr_move;
    
	    if (move == 0)
	        sprite_index = spr_idle;
    
	    xscale = move;
    
	    if (grounded)
	        state = states.normal;
    
	    if (key_taunt && airtaunt == 0)
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
	}
}