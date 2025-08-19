with (obj_player)
{
    if (grounded && state != states.mach3)
    {
        xscale = other.image_xscale;
        mach2 = 100;
        scr_sound(sound_throw);
        machhitAnim = false;
        state = states.mach3;
        flash = true;
        sprite_index = spr_mach4;
        instance_create(x, y, obj_jumpdust);
        movespeed = 12;
    }
}
