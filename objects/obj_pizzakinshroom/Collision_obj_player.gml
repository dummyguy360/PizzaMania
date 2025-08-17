if (obj_player.state != states.hurt && global.shroomfollow == 0)
{
    image_index = 0;
    intro = 1;
    sprite_index = spr_toppinshroom_intro;
    ds_list_add(global.saveroom, id);
    
    if (global.toppintotal < 5)
        obj_tv.message = "You need " + string(5 - global.toppintotal) + " more toppins!";
    
    if (global.toppintotal == 5)
        obj_tv.message = "You have all toppins!";
    
    obj_tv.showtext = 1;
    obj_tv.alarm[0] = 150;
    global.toppintotal += 1;
    scr_sound(sound_toppingot);
    global.shroomfollow = 1;
    panic = 0;
}
