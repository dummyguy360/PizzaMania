if (fadein == 0)
    fadealpha += 0.1;
else if (fadein == 1)
    fadealpha -= 0.1;

if (fadealpha > 1)
{
    fadein = 1;
    
    if (instance_exists(obj_player))
    {
        with (obj_player)
        {
            if (is_real(obj_player.targetRoom))
            {
                if (room != obj_player.targetRoom)
                    room_goto(obj_player.targetRoom);
            }
            else
                show_debug_message("ERROR: targetRoom is not a valid room index: " + string(obj_player.targetRoom));
        }
    }
}

if (instance_exists(obj_player))
{
    with (obj_player)
    {
        if (other.fadein == 1 && (state == states.door || state == states.victory || state == states.titlescreen) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate) || state == states.titlescreen))
        {
            state = states.comingoutdoor;
            image_index = 0;
        }
    }
}

if (fadein == 1 && fadealpha < 0)
    instance_destroy();

if (gotonoplayer == 1)
{
    obj_player.targetRoom = Titlescreen;
    obj_player.player_x = 32;
    obj_player.player_y = 100;
    obj_player.fallAnim = 1;
    obj_player.character = "P";
    
    if (room == Titlescreen)
    {
        obj_player.sprite_index = spr_player_machfreefall;
        obj_player.state = states.machfreefall;
        obj_player.vsp = -5;
        obj_player.movespeed = 7;
    }
}
