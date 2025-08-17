var w = display_get_width();
var h = display_get_height();

if (!surface_exists(global.dark_surface) || surface_get_width(global.dark_surface) != w || surface_get_height(global.dark_surface) != h)
{
    if (surface_exists(global.dark_surface))
        surface_free(global.dark_surface);
    
    global.dark_surface = surface_create(w, h);
}

surface_set_target(global.dark_surface);
draw_clear_alpha(c_black, 0);

if (global.dark_mode)
{
    with (obj_player)
    {
        if (visible && sprite_index != -1)
            draw_self();
    }
}
else
{
    with (all)
    {
        if (object_index != obj_drawcontroller && visible && sprite_index != -1)
            draw_self();
    }
}

for (var i = 0; i < array_length_1d(global.dark_layers); i++)
{
    var tilemap_id = global.dark_layers[i];
    draw_tilemap(tilemap_id, 0, 0);
}

surface_reset_target();
draw_surface_ext(global.dark_surface, 0, 0, 1, 1, 0, c_black, 1);
