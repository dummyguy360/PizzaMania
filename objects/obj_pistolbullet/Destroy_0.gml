if (dynamite == 0)
    instance_create(x, y, obj_balloonpop);

if (dynamite == 1)
{
    instance_create(x, y - 32, obj_explosioneffect);
    instance_create(x, y - 32, obj_bangeffect);
}

if (dynamite == 1)
{
    if (distance_to_object(obj_player) < 32)
    {
        with (obj_player)
        {
            vsp = -14;
            image_index = 0;
            sprite_index = spr_Sjump;
            state = states.Sjump;
        }
    }
    
    with (obj_camera)
    {
        shake_mag = 20;
        shake_mag_acc = 40 / room_speed;
    }
    
    scr_sound(sound_explosion);
}
