hsp = image_xscale * movespeed;

if (!scr_slope() && instance_place(x + sign(hsp), y, obj_solid))
{
    repeat (8)
        instance_create(x, y, obj_slimedebris);
    
    instance_destroy();
}

scr_collide();
var bullet = instance_place(x + 1, y, obj_pistolbullet);

if (bullet == -4)
    bullet = instance_place(x - 1, y, obj_pistolbullet);

if (bullet != -4)
{
    repeat (8)
        instance_create(x, y, obj_slimedebris);
    
    with (bullet)
        instance_destroy();
    
    instance_destroy();
}
