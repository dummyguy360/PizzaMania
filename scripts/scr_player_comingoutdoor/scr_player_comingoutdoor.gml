function scr_player_comingoutdoor()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	hsp = 0;

	if (floor(image_index) == (image_number - 1) || (!place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_keydoor) && !place_meeting(x, y, obj_exitgate)))
	{
	    start_running = 1;
	    movespeed = 0;
	    state = states.normal;
	    image_alpha = 1;
	}

	sprite_index = spr_walkfront;

	if (character == "P" || character == "N")
	    image_speed = 0.35;
	else
	    image_speed = 0.75;
}