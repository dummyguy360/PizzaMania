if (obj_player.state != states.hurt && global.cheesefollow == 0)
{
    image_index = 0;
    intro = 1;
    sprite_index = spr_toppincheese_intro;
    ds_list_add(global.saveroom, id);
    
    if (global.toppintotal < 5)
        obj_tv.message = "You need " + string(5 - global.toppintotal) + " more toppins!";
    
    if (global.toppintotal == 5)
        obj_tv.message = "You have all toppins!";
    
    obj_tv.showtext = 1;
    obj_tv.alarm[0] = 150;
    global.toppintotal += 1;
    scr_sound(sound_toppingot);
    global.cheesefollow = 1;
    panic = 0;
    
    with (obj_player)
    {
        if (character == "P")
        {
            var sounds = [va_happy1, va_happy2, va_happy3];
            scr_sound(sounds[irandom(array_length_1d(sounds) - 1)]);
        }
        else if (character == "M")
        {
            var sounds = [va_pepperman_happy1, va_pepperman_happy2];
            scr_sound(sounds[irandom(array_length_1d(sounds) - 1)]);
        }
        else if (character == "G")
        {
            scr_sound(sound_geromegot);
        }
    }
}
