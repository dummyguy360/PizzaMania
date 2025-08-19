if (global.panic == true)
    image_index = 1;

if (place_meeting(x, y, obj_player) && obj_player.state != states.comingoutdoor && image_index == 1 && global.panic == false)
{
    ds_list_add(global.saveroom, id);
    image_index = 0;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    obj_player.state = states.backbreaker;
    obj_player.image_index = 0;
    global.last_x = obj_player.player_x;
    global.last_y = obj_player.player_y;
    
    if (obj_player.character == "M")
        obj_player.image_speed = 0.7;
    
    obj_player.sprite_index = obj_player.spr_Timesup;
    obj_tv.image_index = 0;
    scr_sound(sound_maximumspeedland);
}
