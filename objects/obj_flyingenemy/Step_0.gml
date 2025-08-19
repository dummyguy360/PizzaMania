image_speed = 0.35;
hsp = 0;
vsp = 0;

if (bounce == false)
    sprite_index = spr_ancho;

if (bounce == true)
{
    hsp = 0;
    sprite_index = spr_anchobounce;
    
    if (floor(image_index) == 12)
        bounce = false;
}

vsp = -0.5;
scr_collide();
