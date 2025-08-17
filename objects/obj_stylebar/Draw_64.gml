if (obj_player.character != "G" || room != rank_room || room != Realtitlescreen || room != hub_room1)
{
    draw_sprite_ext(sprite, index, 230, 75, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_barpop, 0, 205, 81, 1, 1, 0, c_white, 1);
    draw_sprite_part_ext(spr_barpop, 1, 0, 0, (sprite_get_width(spr_barpop) * global.style) / 55, sprite_get_height(spr_barpop), 223, 81, 1, 1, c_white, 1);
}
