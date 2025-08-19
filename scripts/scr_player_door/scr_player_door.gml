function scr_player_door()
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
	sprite_index = spr_lookdoor;

	if (character == "M")
	    image_speed = 0.7;

	if (floor(image_index) == 4)
	{
	    image_speed = 0;
    
	    if (character == "M")
	        image_index = 13;
	}
}