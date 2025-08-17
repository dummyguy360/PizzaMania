if (movespeed != 0 && (trail_timer % 4) == 0)
{
    var t = instance_create(x, y, obj_trail);
    t.sprite_index = sprite_index;
    t.image_index = image_index;
    t.image_xscale = image_xscale;
    t.image_yscale = image_yscale;
    t.image_angle = image_angle;
    t.image_blend = c_red;
}

draw_self();

if (flash)
{
    shader_set(shd_hit);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
}
