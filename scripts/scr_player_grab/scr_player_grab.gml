function scr_player_grab()
{
	grav = 0.5;
	anger = 100;
	move = key_left2 + key_right2;

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;

	if (movespeed > 0)
	    movespeed -= 1;

	if (movespeed < 0)
	    movespeed = 0;

	image_speed = 0.35;

	if (key_slap2 && suplexhavetomash <= 0)
	{
	    scr_sound(sound_slapswipe1);
	    hsp = 0;
	    movespeed = 0;
	    state = 34;
	    image_index = 0;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (key_attack2)
	{
	    state = 88;
	    instance_create(x, y, obj_jumpdust);
	}

	if (move == xscale)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = 40;
	    image_index = 1;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (move == -xscale)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = 41;
	    image_index = 1;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (key_up2)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = 42;
	    image_index = 1;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (key_down2)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = 43;
	    image_index = 1;
	    image_speed = 0.35;
    
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
	}

	landAnim = 0;

	if (key_jump)
	{
	    scr_sound(sound_jump);
	    hsp = 0;
	    movespeed = 0;
	    sprite_index = spr_piledriver;
	    vsp = -14;
	    state = 36;
	    image_index = 0;
	    image_speed = 0.35;
	}

	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_suplexmash1 || spr_suplexmash2 || spr_suplexmash3 || spr_suplexmash4))
	    sprite_index = spr_grab;
}