with (obj_player)
{
    if (grounded && state != states.mach3)
    {
        xscale = other.image_xscale;
        mach2 = 100;
        scr_sound(sound_throw);
        machhitAnim = 0;
        state = states.mach3;
        flash = 1;
        sprite_index = spr_mach4;
        instance_create(x, y, obj_jumpdust);
        movespeed = 12;
    }
}
