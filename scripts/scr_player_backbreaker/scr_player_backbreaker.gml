function scr_player_backbreaker()
{
	mach2 = 0;
	hsp = 0;
	movespeed = 0;
	landAnim = 0;

	if (sprite_index == spr_taunt)
	{
	    taunttimer--;
	    vsp = 0;
	}

	if (sprite_index == spr_taunt && tauntsound == 0)
	{
	    tauntsound = 1;
	    scr_sound(sound_taunt);
	}

	if (taunttimer == 0 && sprite_index == spr_taunt)
	{
	    tauntsound = 0;
	    movespeed = tauntstoredmovespeed;
	    sprite_index = tauntstoredsprite;
	    state = tauntstoredstate;
    
	    if (global.combotime > 0 && global.combo > 0)
	    {
	        if (global.combo == 1)
	        {
	            scr_sound(sound_combo1);
	            instance_create(x, y, obj_10);
	            global.collect += 10;
	        }
        
	        if (global.combo == 2)
	        {
	            scr_sound(sound_combo2);
	            instance_create(x, y, obj_20);
	            global.collect += 20;
	        }
        
	        if (global.combo == 3)
	        {
	            scr_sound(sound_combo3);
	            instance_create(x, y, obj_40);
	            global.collect += 40;
	        }
        
	        if (global.combo >= 4)
	        {
	            scr_sound(sound_combo4);
	            instance_create(x, y, obj_80);
	            global.collect += 80;
	        }
	    }
    
	    global.combotime = 0;
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
	    state = states.normal;

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && !place_meeting(x, y, obj_exitgate))
	{
	    global.panic = 1;
	    sprite_index = spr_bossintro;
	    image_index = 0;
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
	    state = states.normal;

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_victory)
	    state = states.normal;

	if (key_jump && sprite_index == spr_player_phoneidle)
	{
	    global.panic = 1;
	    sprite_index = spr_bossintro;
	    image_index = 0;
    
	    with (instance_create(x, y, obj_debris))
	    {
	        image_index = 0;
	        sprite_index = spr_phonedebris;
	    }
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bossintro)
	    state = states.normal;

	if (sprite_index == spr_bossintro)
	{
	    var lay_id = layer_get_id("Backgrounds_1");
	    var back_id = layer_background_get_id(lay_id);
	    var lay_id2 = layer_get_id("Backgrounds_2");
	    var back_id2 = layer_background_get_id(lay_id2);
	    var lay_id3 = layer_get_id("Backgrounds_3");
	    var back_id3 = layer_background_get_id(lay_id3);
	    var lay_id4 = layer_get_id("Backgrounds_stillZH1");
	    var back_id4 = layer_background_get_id(lay_id4);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id) == bg_desert)
	        layer_background_sprite(back_id, bg_desertescape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id) == bg_desertmountain)
	        layer_background_sprite(back_id, bg_desertmountainnight);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id) == bg_castle3)
	        layer_background_sprite(back_id, bg_castle3escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id) == bg_castle4)
	        layer_background_sprite(back_id, bg_castle4escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id3) == bg_castle1)
	        layer_background_sprite(back_id3, bg_castle1escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id) == bg_factory3)
	        layer_background_sprite(back_id, bg_factory3escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id) == bg_factory1)
	        layer_background_sprite(back_id, bg_factory1escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id2) == bg_factory2)
	        layer_background_sprite(back_id2, bg_factory2escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id) == bg_sewer1)
	        layer_background_sprite(back_id, bg_sewer1escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id2) == bg_sewer2)
	        layer_background_sprite(back_id2, bg_sewer2escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id3) == bg_sewer3)
	        layer_background_sprite(back_id3, bg_sewer3escape);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id4) == bg_desertcloudH)
	        layer_background_sprite(back_id4, spr_desertcloudHnight);
    
	    if (global.panic == 1 && layer_background_get_sprite(back_id4) == bg_desertcloud)
	        layer_background_sprite(back_id4, bg_desertcloudnight);
    
	    obj_tv.tvsprite = spr_tvexit;
	    obj_tv.showtext = 1;
    
	    if (obj_player.character != "G")
	        obj_tv.message = "Get back to the start!!";
	    else
	        obj_tv.message = "Get out of the tower!!";
    
	    obj_tv.alarm[0] = 150;
	}

	if (obj_player.character == "P" || obj_player.character == "N")
	    image_speed = 0.35;
	else
	    obj_player.image_speed = 0.7;
}