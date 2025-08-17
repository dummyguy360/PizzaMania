with (obj_player)
{
    if (key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.Sjumpprep) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
    {
        mach2 = 0;
        obj_camera.chargecamera = 0;
        
        if (character != "G")
            ds_list_add(global.saveroom, id);
        
        player_y = other.target_y;
        player_x = other.target_x;
        global.last_x = player_x;
        global.last_y = player_y;
        scr_sound(sound_door);
        targetRoom = other.targetRoom;
        
        if (character != "G")
            other.visited = 1;
        
        image_index = 0;
        state = states.door;
        instance_create(x, y, obj_fadeout);
    }
}
