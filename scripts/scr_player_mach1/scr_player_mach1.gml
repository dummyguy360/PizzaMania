function scr_player_mach1()
{
	dir = xscale;
	move = key_left + key_right;
	landAnim = false;
	sprite_index = spr_mach1;

	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + 1, y, obj_slope))
	{
	    mach2 = 0;
	    state = states.normal;
	    movespeed = 0;
	}

	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x - 1, y, obj_slope))
	{
	    mach2 = 0;
	    state = states.normal;
	    movespeed = 0;
	}

	if (character != "M")
	{
	    if (movespeed <= 8)
	        movespeed += 0.25;
	}

	if (character == "M" && movespeed < 12)
	    movespeed += 1;

	machhitAnim = false;
	crouchslideAnim = true;

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;

	if (grounded && xscale == 1 && move == -1)
	{
	    momemtum = false;
	    mach2 = 0;
	    movespeed = 0;
	    image_index = 0;
	    xscale = -1;
	}

	if (grounded && xscale == -1 && move == 1)
	{
	    momemtum = false;
	    mach2 = 0;
	    movespeed = 0;
	    image_index = 0;
	    xscale = 1;
	}

	if (grounded)
	{
	    if (mach2 < 35)
	        mach2++;
    
	    if (character != "V")
	    {
	        if (mach2 >= 35)
	        {
	            movespeed = 10;
	            state = states.mach2;
	            instance_create(x, y, obj_jumpdust);
	        }
	    }
	    else if (mach2 >= 30)
	    {
	        mach2 = 35;
	        movespeed = 10;
	        state = states.mach2;
	        sprite_index = spr_mach;
	        instance_create(x, y, obj_jumpdust);
	    }
	}

	if (!grounded)
	{
	    sprite_index = spr_airdash1;
	    momemtum = true;
	    state = states.jump;
	    jumpAnim = false;
	    image_index = 0;
	}

	if (!key_attack && grounded)
	{
	    state = states.normal;
	    image_index = 0;
	    mach2 = 0;
	}

	if (key_down && character != "M")
	{
	    sprite_index = spr_crouchslip;
	    state = states.crouchslide;
	    mach2 = 0;
	}

	image_speed = 0.45;

	if (key_jump && grounded && key_attack)
	{
	    scr_sound(sound_jump);
	    sprite_index = spr_airdash1;
	    dir = xscale;
	    momemtum = true;
	    vsp = -11;
	    movespeed += 2;
	    state = states.jump;
	    jumpAnim = true;
	    image_index = 0;
	}

	if (sprite_index == spr_pepperman_shoulderstart && image_index >= (image_number - 1))
	{
	    mach2 = 100;
	    flash = true;
	    state = states.mach2;
	}

	if (!instance_exists(obj_dashcloud) && grounded)
	    instance_create(x, y, obj_dashcloud);

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

	if (key_up && key_slap && character == "N" && grounded && movespeed != 0)
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
	else if (key_taunt)
	{
	    taunttimer = 20;
	    tauntstoredmovespeed = movespeed;
	    tauntstoredsprite = sprite_index;
	    tauntstoredstate = state;
	    state = states.backbreaker;
	    image_index = random_range(0, 6);
	    sprite_index = spr_taunt;
	    instance_create(x, y, obj_taunteffect);
	}

	if (character == "P")
	{
	    if (key_shoot2)
	    {
	        vsp = -4;
	        sprite_index = spr_player_pistolair;
	        state = states.pistol;
	        image_index = 0;
	        shoot = true;
	    }
	}
}