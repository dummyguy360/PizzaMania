with (obj_player)
{
    if (place_meeting(x, y, obj_tomatoblock) && state != states.gameover)
    {
        if (key_jump2)
            obj_player.vsp = -20;
        else if (character != "G")
            vsp = -11;
        else
            vsp = -8;
        
        if (character == "P")
        {
            if (state == states.jump)
                sprite_index = spr_player_Sjump;
        }
        
        with (instance_place(x, y + 1, obj_tomatoblock))
        {
            image_index = 0;
            image_speed = 0.35;
        }
    }
}

with (obj_barrel)
{
    var block = instance_place(x, y + 1, obj_tomatoblock);
    
    if (block != noone)
    {
        with (block)
        {
            image_index = 0;
            image_speed = 0.35;
        }
    }
}
