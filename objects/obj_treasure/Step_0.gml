if (sprite_index == sprgot && obj_player.state != 16)
    instance_destroy();

if (spr == spr_cheeseblob)
{
    sprgot = spr_treasure1pick;
    spridle = spr_treasure1;
}

if (spr == spr_cheesemaker)
{
    sprgot = spr_beantreasuregot;
    spridle = spr_beantreasure;
}

if (sprite_index != sprgot)
    sprite_index = spridle;
