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
