function scr_player_freefallland()
{
	if (character != "N")
	    mach2 = 0;

	falldamage = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	movespeed = 0;

	if (character != "V" && character != "N")
	    facehurt = 1;

	start_running = 1;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;

	if (character == "N")
	    sprite_index = spr_playerN_noisecrusherland;

	if (character == "V")
	    sprite_index = spr_playerV_bodyslamland;

	if (character == "P")
	    sprite_index = spr_player_bodyslamland;

	if (sprite_index == spr_player_bodyslamland && key_jump && character == "P")
	{
	    movespeed = 8;
	    vsp = -12;
	    image_index = 0;
	    state = states.machfreefall;
	}

	if (sprite_index == spr_playerN_noisecrusherland && key_jump2 && character == "N")
	{
	    var sounds = [va_noise_woag, va_noise_wawaoh, va_noise_waow];
	    scr_sound(sounds[irandom(array_length_1d(sounds) - 1)]);
	    flash = 1;
	    scr_sound(sound_noisepogo);
	    sprite_index = spr_playerN_pogobounce;
	    image_index = 0;
	    state = states.machfreefall;
	}

	if (floor(image_index) == (image_number - 1))
	{
	    handstand = 0;
	    state = states.normal;
	}

	if (floor(image_index) == (image_number - 1) && superslam > 30)
	{
	    state = states.machfreefall;
	    vsp = -7;
	}

	image_speed = 0.35;
}