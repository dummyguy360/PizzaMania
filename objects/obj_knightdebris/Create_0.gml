image_speed = 0;
vsp = random_range(-10, -5);
hsp = -obj_player.xscale * random_range(4, 8);
grav = 0.4;

if (obj_player.character == "P")
    sprite_index = spr_knightdebris;

if (obj_player.character == "N")
    sprite_index = spr_playerN_knightdebris;

image_xscale = obj_player.xscale;
