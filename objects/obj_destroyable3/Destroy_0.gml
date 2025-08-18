if (ds_list_find_index(global.saveroom, id) == -1 && type == false)
{
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    tile_layer_delete_at(1, x, y);
    tile_layer_delete_at(1, x + 32, y);
    tile_layer_delete_at(1, x + 32, y + 32);
    tile_layer_delete_at(1, x, y + 32);
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
    ds_list_add(global.saveroom, id);
}

if (ds_list_find_index(global.saveroom, id) == -1 && type == true)
{
    with (instance_create(x + 32, y + 32, obj_sausageman_dead))
        sprite_index = spr_bigdoughblockdead;
    
    scr_sleep(5);
    tile_layer_delete_at(1, x, y);
    tile_layer_delete_at(1, x + 32, y);
    tile_layer_delete_at(1, x + 32, y + 32);
    tile_layer_delete_at(1, x, y + 32);
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
    ds_list_add(global.saveroom, id);
}
