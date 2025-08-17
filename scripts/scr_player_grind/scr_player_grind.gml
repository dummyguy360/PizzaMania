function scr_player_grind()
{
	vsp = 0;
	machhitAnim = 0;
	crouchslideAnim = 1;
	hsp = xscale * movespeed;

	if (!grinding)
	    state = states.mach2;

	if (movespeed < 1)
	    movespeed = 10;

	if (movespeed < 10)
	    movespeed += 0.05;

	if (character == "V")
	    instance_create(x, y + 32, obj_slimedebris);

	if (key_jump)
	{
	    vsp = -9;
	    state = states.mach2;
	    grinding = 0;
	}

	if (character == "P")
	    sprite_index = spr_player_grind;

	if (character == "N")
	    sprite_index = spr_playerN_grind;

	if (character == "V")
	    sprite_index = spr_playerV_slipping;

	if (character == "M")
	    sprite_index = spr_pepperman_grindrail;

	image_speed = 0.35;

	if (!instance_exists(obj_grindeffect))
	    instance_create(x, y, obj_grindeffect);
}