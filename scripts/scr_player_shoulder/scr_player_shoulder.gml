function scr_player_shoulder()
{
	movespeed = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;

	if (floor(image_index) == (image_number - 1))
	    state = states.normal;

	sprite_index = spr_shoulder;
	image_speed = 0.35;
}