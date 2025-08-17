function scr_player_gottreasure()
{
	if (character != "G")
	    sprite_index = spr_gottreasure;
	else if (character == "G")
	    sprite_index = spr_idle;

	mach2 = 0;
	image_speed = 0.2;
	obj_music.currentlyjingling = 2;
	obj_music.jingle = 1;
}