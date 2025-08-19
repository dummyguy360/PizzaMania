function scr_player_keyget()
{
	hsp = 0;
	vsp = 0;

	if (character != "G")
	    image_speed = 0.35;
	else
	    image_speed = 0.7;

	movespeed = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;

	if (character != "G")
	    sprite_index = spr_keyget;
	else
	    sprite_index = spr_idle;

	if (floor(image_index) == (image_number - 1))
	{
	    global.keyget = false;
	    state = states.normal;
	    image_index = 0;
	}
}