if (cigar == 1)
{
    pal_swap_set(spr_sausageman_palette, 1, 0);
    draw_self();
    shader_reset();
}
else
    draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, angle, c_white, 1);