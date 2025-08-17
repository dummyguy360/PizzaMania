if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    tile_layer_delete_at(1, x, y);
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
    global.breaksound = 0;
    ds_list_add(global.saveroom, id);
}
