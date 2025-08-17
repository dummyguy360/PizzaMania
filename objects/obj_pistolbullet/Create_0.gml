mask_index = spr_peppalette;
dynamite = obj_player.handstand;

if (dynamite == 0)
    sprite_index = choose(spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_pineapplecollect, spr_sausagecollect);

if (dynamite == 1)
    sprite_index = spr_dynamite;

if (dynamite == 1)
{
    vsp = -4;
    grav = 0.5;
}

if (dynamite == 0)
{
    vsp = 0;
    grav = 0;
}

vspeed = vsp;
gravity = grav;
