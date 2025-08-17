with (obj_player)
{
    if (state != states.Sjump)
    {
        if (state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes)
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5;
        }
        
        if (state == states.bombpep)
            instance_create(x, y, obj_bombexplosion);
        
        scr_sound(sound_superjumprelease);
        image_index = 0;
        
        if (character != "M")
        {
            sprite_index = spr_Sjump;
            state = states.Sjump;
            
            if (global.moveset == 0)
                vsp = -10;
        }
        else
        {
            sprite_index = spr_pepperman_rolling;
            global.was_grounded = 1;
            vsp = -26;
            state = states.chainsawpogo;
        }
        
        other.image_index = 0;
        other.image_speed = 0.35;
    }
}
