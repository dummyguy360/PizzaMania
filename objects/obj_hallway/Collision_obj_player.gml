with (obj_player)
{
    if (!instance_exists(obj_fadeout))
    {
        if (variable_instance_exists(-2, "target_x") && variable_instance_exists(-2, "target_y") && variable_instance_exists(-2, "targetRoom"))
        {
            player_y = other.target_y;
            player_x = other.target_x;
            global.last_x = player_x;
            global.last_y = player_y;
            scr_sound(sound_door);
            targetRoom = other.targetRoom;
            other.visited = 1;
        }
        
        image_index = 0;
        
        if (state == states.machslide)
            state = states.normal;
        
        instance_create(x, y, obj_fadeout);
    }
}
