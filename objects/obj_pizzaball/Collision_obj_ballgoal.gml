if (vsp > 0)
{
    instance_destroy();
    instance_destroy(obj_pizzaballblock);
    obj_player.state = 44;
    obj_player.sprite_index = obj_player.spr_victory;
    obj_player.image_index = 0;
    
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
        {
            scr_sound(sound_geromegot);
        }
    }
}
