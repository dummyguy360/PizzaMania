if (inv_frame == 0 && obj_player.state != states.knightpep && obj_player.state != states.cheeseball && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepattack && obj_player.state != states.knightpepslopes && obj_player.state != states.hurt)
{
    instance_destroy();
    global.key_inv = 1;
    obj_player.key_particles = 1;
    obj_player.alarm[7] = 30;
}

if (global.keyget == 0 && obj_player.state != states.knightpep && obj_player.state != states.knightpepattack && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepslopes)
{
    scr_sound(sound_toppingot);
    
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
            scr_sound(sound_geromegot);
    }
    
    obj_player.state = states.keyget;
    obj_player.image_index = 0;
    global.keyget = 1;
}
