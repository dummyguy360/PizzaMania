if (turning == 0)
    hsp = image_xscale * movespeed;
else
    hsp = -image_xscale * movespeed;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
    thrown = 0;

if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && (y + 200) > obj_player.y)
    attack = 1;

if (attack == 1)
{
    if (y < obj_player.y && vsp <= 4)
        vsp += 0.5;
    
    if (y >= obj_player.y && vsp > -4)
        vsp -= 0.5;
    
    sprite_index = spr_piraneappleattack;
    
    if (movespeed < 8 && turning == 0)
        movespeed += 0.1;
    
    if (movespeed != 0 && turning == 1)
        movespeed -= 0.1;
}

if (movespeed == 0)
    turning = 0;

trail_timer++;

if (image_xscale != sign(obj_player.x - x) && x != obj_player.x)
{
    image_xscale = sign(obj_player.x - x);
    turning = 1;
}

if (place_meeting(x + floor(hsp), y, obj_null))
{
    x = floor(x);
    
    while (!place_meeting(x + sign(hsp), y, obj_null))
        x += sign(hsp);
    
    hsp = 0;
}

x += hsp;

if (place_meeting(x, y + floor(vsp), obj_null))
{
    y = floor(y);
    
    while (!place_meeting(x, y + sign(vsp), obj_null))
        y += sign(vsp);
    
    vsp = 0;
}

y += floor(vsp);

if (hitboxcreate == 0 && obj_player.state != states.handstandjump && obj_player.state != states.mach3)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox))
    {
        sprite_index = other.sprite_index;
        ID = other.id;
    }
}

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}

var bullet = instance_place(x + 1, y, obj_pistolbullet);

if (bullet == noone)
    bullet = instance_place(x - 1, y, obj_pistolbullet);

if (bullet != noone)
{
    shot = 1;
    
    with (bullet)
        instance_destroy();
    
    instance_destroy();
}
