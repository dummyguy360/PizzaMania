if (other.image_index == 0 && state == states.normal && grounded && (character == "P" || character == "N"))
{
    scr_sound(sound_slapswipe1);
    momentum = 0;
    movespeed = 0;
    other.image_index = 1;
    image_index = 0;
    
    if (character == "P")
        sprite_index = spr_knightpep_start;
    
    if (character == "N")
        sprite_index = spr_playerN_knightsword;
    
    state = states.knightpep;
    hsp = 0;
}
