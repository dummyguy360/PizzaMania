if (character == "P" || character == "N")
{
    image_index = 0;
    
    if (character == "P")
        sprite_index = spr_knightpep_thunder;
    
    if (character == "N")
        sprite_index = spr_playerN_knightstart;
    
    scr_sound(sound_becomeknight);
    instance_destroy(other.id);
    
    with (obj_camera)
    {
        shake_mag = 10;
        shake_mag_acc = 30 / room_speed;
    }
}
