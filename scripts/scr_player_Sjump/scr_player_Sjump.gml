function scr_player_Sjump()
{
	hsp = 0;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	move = key_left + key_right;

	if (sprite_index == spr_Sjump)
	{
	    vsp = -16;
    
	    if (!instance_exists(obj_mach3effect))
	        instance_create(x, y, obj_mach3effect);
	}

	if (character == "N" && sprite_index == spr_Sjump)
	{
	    hsp = move * movespeed;
    
	    if (move != 0)
	        xscale = move;
    
	    if (move != 0)
	    {
	        if (movespeed < 4)
	            movespeed += 0.25;
	        else if (movespeed > 4)
	            movespeed = 4;
	    }
    
	    if (move == 0)
	        movespeed = 0;
	}

	if (sprite_index == spr_playerV_superjump)
	{
	    if (image_index >= 10)
	    {
	        image_index = 10;
	        image_speed = 0;
	    }
	    else
	        image_speed = 1;
	}

	if (sprite_index == spr_Sjumpcancelstart)
	{
	    vsp = 0;
    
	    if (move == -1)
	        xscale = -1;
    
	    if (move == 1)
	        xscale = 1;
	}

	if (sprite_index != spr_crazyrun && scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
	{
	    scr_sound(sound_maximumspeedland);
	    a = 0;
    
	    if (sprite_index == spr_player_supersidejump)
	        sprite_index = spr_player_supersidejumpland;
	    else if (sprite_index == spr_Sjump)
	        sprite_index = spr_Sjumpland;
    
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
    
	    if (character == "M")
	    {
	        hsp = -hsp * 0.8;
	        vsp = 5;
	        image_index = 0;
	    }
	    else
	    {
	        image_index = 0;
	        state = states.Sjumpland;
	        machhitAnim = 0;
	    }
	}

	if (sprite_index != spr_crazyrun && character != "V")
	    image_speed = 0.5;
	else
	    image_speed = 0.75;

	scr_collide_player();

	if ((key_attack2 || key_slap2) && character == "V")
	{
	    movespeed = 12;
	    machhitAnim = 0;
    
	    if (move == -1)
	        xscale = -1;
    
	    if (move == 1)
	        xscale = 1;
    
	    mach2 = 100;
	    sprite_index = spr_mach4;
	    image_index = 0;
	    state = states.mach3;
	}

	if ((key_attack2 || key_slap2) && (character == "P" || character == "N"))
	{
	    scr_sound(sound_sjumpcancel);
	    movespeed = 0;
	    machhitAnim = 0;
    
	    if (move == -1)
	        xscale = -1;
    
	    if (move == 1)
	        xscale = 1;
    
	    handstand = 2;
	    sprite_index = spr_Sjumpcancelstart;
	    state = states.handstandjump;
	    image_index = 0;
	}
}