with (obj_player)
{
    if (place_meeting(x + hsp, y + vsp, obj_tntblock) && (state == states.handstandjump || state == states.mach3 || state == states.mach2))
    {
        if (character != "M")
        {
            image_index = 0;
            sprite_index = spr_Sjump;
            hsp = 0;
            vsp = -14;
            state = states.Sjump;
            other.exploded = 1;
        }
        
        if (character == "M")
        {
            image_index = 0;
            flash = 1;
            global.was_grounded = 1;
            sprite_index = spr_pepperman_rolling;
            movespeed = 0;
            hsp = 0;
            
            if (key_jump)
                vsp = -32;
            else
                vsp = -14;
            
            state = states.chainsawpogo;
            other.exploded = 1;
        }
    }
}

if (exploded == 1)
    instance_destroy();
