function scr_player_Sjumpland()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	machslideAnim = true;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	movespeed = 0;
	start_running = 1;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;

	if (floor(image_index) == 6)
	{
	    sprite_index = spr_machfreefall;
	    state = states.jump;
	    jumpAnim = false;
	}
}