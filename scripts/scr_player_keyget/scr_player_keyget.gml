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
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;

	if (character != "G")
	    sprite_index = spr_keyget;
	else
	    sprite_index = spr_idle;

	if (floor(image_index) == (image_number - 1))
	{
	    global.keyget = 0;
	    state = states.normal;
	    image_index = 0;
	}
}