function scr_player_Sjumpprep()
{
	combo = 0;
	mach2 = 0;
	move = key_right + key_left;
	var sprite_set = 0;

	if (sprite_index == spr_Sjumpprep)
	{
	    if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	        hsp = xscale * movespeed;
	    else if (place_meeting(x, y + 1, obj_railh))
	        hsp = (xscale * movespeed) - 5;
	    else if (place_meeting(x, y + 1, obj_railh2))
	        hsp = (xscale * movespeed) + 5;
    
	    if (movespeed >= 0)
	        movespeed -= 0.8;
	}

	if (!sprite_set && (sprite_index == spr_Sjumppreplight || sprite_index == spr_Sjumpright || sprite_index == spr_Sjumpleft))
	{
	    if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	        hsp = move * 2;
	    else if (place_meeting(x, y + 1, obj_railh))
	        hsp = (move * 2) - 5;
	    else if (place_meeting(x, y + 1, obj_railh2))
	        hsp = (move * 2) + 5;
    
	    if (move == 0)
	    {
	        sprite_index = spr_Sjumppreplight;
	        sprite_set = 1;
	    }
	    else if (move != 0)
	    {
	        if (xscale == 1)
	            sprite_index = (move == 1) ? spr_Sjumpright : spr_Sjumpleft;
	        else
	            sprite_index = (move == 1) ? spr_Sjumpleft : spr_Sjumpright;
        
	        sprite_set = 1;
	    }
	}

	if (!sprite_set && sprite_index == spr_Sjumpprep && floor(image_index) == (image_number - 1))
	{
	    sprite_index = spr_Sjumppreplight;
	    sprite_set = 1;
	}

	if (!key_up && (sprite_index == spr_Sjumppreplight || sprite_index == spr_Sjumpleft || sprite_index == spr_Sjumpright) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
	    scr_sound(sound_superjumprelease);
	    instance_create(x, y, obj_explosioneffect);
	    sprite_index = spr_Sjump;
	    state = states.Sjump;
	    vsp = (global.moveset == 0) ? -12 : -16;
	}

	if (!audio_is_playing(sound_superjumpcharge2))
	    scr_sound(sound_superjumpcharge2);

	start_running = 1;
	alarm[4] = 14;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	machslideAnim = 1;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	image_speed = (character == "P") ? 0.35 : 0.7;
}