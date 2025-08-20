function scr_player_mach3()
{
	if (character == "P")
	{
	    if (windingAnim < 2000)
	        windingAnim++;
	}

	global.was_grounded = 0;

	if (image_speed > 0.35 && character == "V")
	    image_speed -= 0.05;

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;

	mach2 = 100;
	momemtum = true;
	move = key_right + key_left;
	move2 = key_right2 + key_left2;

	if (movespeed < 18 && move == xscale)
	{
	    movespeed += 0.05;
    
	    if (!instance_exists(obj_crazyruneffect))
	        instance_create(x, y, obj_crazyruneffect);
	}

	if (key_jump && !grounded && sprite_index == spr_dive && character != "M")
	{
	    image_index = 0;
	    vsp = -6;
	    scr_sound(sound_groundpoundstart);
	    state = states.freefallprep;
	}

	if (character == "M" && !grounded && key_jump && global.was_grounded == 0 && sprite_index == spr_dive)
	{
	    scr_sound(sound_groundpoundstart);
	    image_index = 0;
	    sprite_index = spr_pepperman_groundpoundstart;
	    vsp = -6;
	    state = states.chainsawpogo;
	}

	if (global.moveset == 1)
	{
	    if (movespeed > 10)
	        movespeed -= 0.05;
	}
	else if (movespeed > 12 && move != xscale)
	    movespeed -= 0.05;

	crouchslideAnim = true;

	if (!key_jump2 && jumpstop == false && vsp < 0.5)
	{
	    vsp /= 2;
	    jumpstop = true;
	    global.was_grounded = 1;
	}

	if (grounded && vsp > 0)
	{
	    airtaunt = 0;
	    jumpstop = false;
	    global.was_grounded = 0;
	}

	if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && key_attack)
	{
	    scr_sound(sound_jump);
	    image_index = 0;
    
	    if (character != "M")
	        sprite_index = spr_mach3jump;
    
	    vsp = -9;
	}

	if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
	{
	    if (character != "M")
	    {
	        if (sprite_index != spr_dive)
	            sprite_index = spr_mach4;
	        else if (sprite_index != spr_dive)
	            sprite_index = spr_mach;
	    }
	}

	if (character != "M")
	{
	    if (movespeed > 17 && sprite_index != spr_crazyrun)
	    {
	        flash = true;
	        sprite_index = spr_crazyrun;
	    }
	}

	if (sprite_index == spr_crazyrun && !instance_exists(obj_crazyrunothereffect))
	    instance_create(x, y, obj_crazyrunothereffect);

	if (key_jump)
	    input_buffer_jump = 0;

	if (character != "V" && character != "M")
	{
	    if (key_up && grounded)
	    {
	        machpunchAnim = false;
	        scr_sound(sound_superjumpcharge1);
	        sprite_index = spr_Sjumpprep;
	        state = states.Sjumpprep;
	        image_index = 0;
	    }
	}

	if (!key_attack && grounded && sprite_index != spr_mach3hit && character != "M")
	{
	    scr_sound(sound_maximumspeedstop);
	    sprite_index = spr_machslidestart;
	    state = states.machslide;
	    image_index = 0;
	    mach2 = 0;
	}
	else if (!key_attack && grounded)
	{
	    scr_sound(sound_maximumspeedstop);
	    state = states.normal;
    
	    if (movespeed > 0)
	        movespeed -= 0.2;
    
	    image_index = 0;
	    mach2 = 0;
	}

	if (move == -1 && xscale == 1 && grounded)
	{
	    if (character != "M")
	        sprite_index = spr_machslideboost3;
	    else
	        sprite_index = spr_machslide;
    
	    flash = false;
	    state = states.machslide;
	    image_index = 0;
	    mach2 = 100;
	}

	if (move == 1 && xscale == -1 && grounded)
	{
	    if (character != "M")
	        sprite_index = spr_machslideboost3;
	    else
	        sprite_index = spr_machslide;
    
	    flash = false;
	    state = states.machslide;
	    image_index = 0;
	    mach2 = 100;
	}

	if (key_down && grounded && !place_meeting(x, y, obj_dashpad) && character != "M")
	{
	    instance_create(x, y, obj_jumpdust);
	    flash = false;
    
	    if (character != "V")
	        sprite_index = spr_machroll;
	    else
	        sprite_index = spr_playerV_divekickstart;
    
	    state = states.machroll;
	}

	flash = false;

	if (key_down && grounded && !place_meeting(x, y, obj_dashpad) && character == "M")
	{
	    instance_create(x, y, obj_jumpdust);
	    sprite_index = spr_crouchslip;
	    state = states.crouchslide;
	}

	if (key_down && !key_jump && !grounded && !place_meeting(x, y, obj_dashpad))
	{
	    flash = false;
	    vsp = 15;
	    sprite_index = spr_dive;
	}

	if (character != "N")
	{
	    if ((grounded || character == "M") && !scr_slope() && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && xscale == 1)
	    {
	        sprite_index = spr_mach3hitwall;
	        machpunchAnim = false;
	        scr_sound(sound_maximumspeedland);
        
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = 40 / room_speed;
	        }
        
	        hsp = 0;
	        image_speed = 0.35;
        
	        with (obj_baddie)
	        {
	            if (point_in_rectangle(x, y, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), __view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0), __view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0)))
	            {
	                stun = 1;
	                alarm[0] = 200;
	                ministun = 0;
	                vsp = -5;
	                hsp = 0;
	            }
	        }
        
	        flash = false;
	        combo = 0;
	        state = states.bump;
	        hsp = -2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x + 10, y + 10, obj_bumpeffect);
	    }
    
	    if ((grounded || character == "M") && !scr_slope() && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && xscale == -1)
	    {
	        sprite_index = spr_mach3hitwall;
	        machpunchAnim = false;
	        scr_sound(sound_maximumspeedland);
        
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = 40 / room_speed;
	        }
        
	        hsp = 0;
	        image_speed = 0.35;
        
	        with (obj_baddie)
	        {
	            if (point_in_rectangle(x, y, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), __view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0), __view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0)))
	            {
	                stun = 1;
	                alarm[0] = 200;
	                ministun = 0;
	                vsp = -5;
	                hsp = 0;
	            }
	        }
        
	        flash = false;
	        combo = 0;
	        state = states.bump;
	        hsp = 2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
	}

	if (character == "N")
	{
	    if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (grounded || place_meeting(x + sign(hsp), y, obj_railv)))
	    {
	        sprite_index = spr_mach3hitwall;
	        machpunchAnim = false;
	        scr_sound(sound_maximumspeedland);
        
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = 40 / room_speed;
	        }
        
	        hsp = 0;
	        image_speed = 0.35;
        
	        with (obj_baddie)
	        {
	            if (point_in_rectangle(x, y, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), __view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0), __view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0)))
	            {
	                stun = 1;
	                alarm[0] = 200;
	                ministun = 0;
	                vsp = -5;
	                hsp = 0;
	            }
	        }
        
	        flash = false;
	        combo = 0;
	        state = states.bump;
	        hsp = -2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x + 10, y + 10, obj_bumpeffect);
	    }
    
	    if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (grounded || place_meeting(x + sign(hsp), y, obj_railv)))
	    {
	        sprite_index = spr_mach3hitwall;
	        machpunchAnim = false;
	        scr_sound(sound_maximumspeedland);
        
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = 40 / room_speed;
	        }
        
	        hsp = 0;
	        image_speed = 0.35;
        
	        with (obj_baddie)
	        {
	            if (point_in_rectangle(x, y, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), __view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0), __view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0)))
	            {
	                stun = 1;
	                alarm[0] = 200;
	                ministun = 0;
	                vsp = -5;
	                hsp = 0;
	            }
	        }
        
	        flash = false;
	        combo = 0;
	        state = states.bump;
	        hsp = 2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
	}

	if (character != "M")
	{
	    if (((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope))) && sprite_index != spr_dive && !place_meeting(x + hsp, y, obj_metalblock))
	    {
	        wallspeed = 12;
	        state = 10;
	    }
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

	if (!instance_exists(obj_chargeeffect) && sprite_index != spr_dive)
	    instance_create(x, y, obj_chargeeffect);

	if (instance_exists(obj_chargeeffect) && sprite_index == spr_dive)
	    instance_destroy(obj_chargeeffect);

	if (!instance_exists(obj_superdashcloud) && grounded)
	    instance_create(x, y, obj_superdashcloud);

	if (key_slap2 && shotgunAnim == true && global.ammo > 0 && !grounded)
	{
	    global.ammo -= 1;
	    instance_create(x, y + 80, obj_shotgunbulletdown);
	    vsp -= 11;
	    sprite_index = spr_player_shotgunjump1;
	    state = states.shotgun;
	    image_index = 0;
	}

	if (sprite_index == spr_playerV_mach1)
	    image_speed = 0.8;

	if (sprite_index == spr_mach4)
	    image_speed = 0.4;

	if (sprite_index == spr_crazyrun)
	    image_speed = 0.75;

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

	if (key_up && key_slap && character == "N" && movespeed != 0)
	{
	    landAnim = false;
	    image_index = 0;
	    sprite_index = spr_playerN_pogostart;
	    vsp = -6;
	    flash = true;
	    state = states.machfreefall;
	}

	if (key_slap && character == "V")
	{
	    machpunchAnim = false;
	    vsp = -4;
	    global.was_grounded = 1;
	    handstand = 0;
	    tauntstoredsprite = sprite_index;
    
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
	    tauntstoredsprite = sprite_index;
	    handstand = 1;
	    sprite_index = spr_playerV_dynamitethrow;
	    state = states.pistol;
	    image_index = 0;
	    shoot = true;
	}

	if (grounded && sprite_index == spr_dive)
	    sprite_index = spr_mach4;

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

	if (machpunchAnim == true && sprite_index != spr_mach3hit && state != states.machslide)
	{
	    image_index = 0;
	    sprite_index = spr_mach3hit;
    
	    if (floor(image_index) == -1 && sprite_index == spr_mach3hit)
	        machpunchAnim = false;
	}

	if (!grounded)
	    machpunchAnim = false;

	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_mach3hit || sprite_index == spr_player_rollgetup || sprite_index == spr_playerN_rollgetup))
	    sprite_index = spr_mach4;

	if (sprite_index == spr_playerV_mach1 && floor(image_index) == (image_number - 1))
	{
	    flash = true;
	    sprite_index = tauntstoredsprite;
	}
}