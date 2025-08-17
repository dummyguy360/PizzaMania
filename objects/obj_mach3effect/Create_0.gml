image_speed = 0;
image_angle = obj_player.draw_angle;
image_index = obj_player.image_index - 1;
alarm[0] = 15;
image_xscale = obj_player.xscale;

if (obj_player.sprite_index != obj_player.spr_climbwall)
    sprite_index = obj_player.sprite_index;

if (obj_player.character != "P" && sprite_index == spr_player_mach)
    instance_destroy();

randomize();
image_blend = choose(make_color_rgb(255, 0, 0), make_color_rgb(0, 255, 0));
alarm[1] = 3;
