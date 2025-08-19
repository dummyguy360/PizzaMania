function scr_player_victory()
{
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;

	if (place_meeting(x, y, obj_keydoor))
	{
	    if (character != "G")
	        sprite_index = spr_victory;
	    else
	        sprite_index = spr_gerome_lookdoor;
	}

	if (place_meeting(x, y, obj_startgate))
	    sprite_index = spr_entergate;

	if (floor(image_index) == (image_number - 1))
	    image_speed = 0;
	else if (character == "P" || character == "N")
	    image_speed = 0.35;
	else
	    image_speed = 0.7;
}