function scr_player_tackle()
{
	combo = 0;
	movespeed = 0;
	mach2 = 0;
	start_running = 1;

	if (grounded && vsp > 0)
	    hsp = 0;

	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;

	if (floor(image_index) == (image_number - 1))
	    state = states.normal;

	sprite_index = spr_tackle;

	if (character != "M")
	    image_speed = 0.35;
	else
	    image_speed = 0.7;
}