if (vsp < 12)
    vsp += grav;

if (grounded)
{
    sprite_index = spr_barrel;
    image_speed = 0;
    hsp = 0;
    bounce = false;
}

if (!grounded)
{
    sprite_index = spr_barrelfloat;
    image_speed = 0.35;
}

if (place_meeting(x - 5, y, obj_player) && obj_player.dir == 1 && bounce == false)
{
    vsp = -9;
    hsp = 7;
    
    if (obj_player.character != "G")
    {
        obj_player.vsp = -4;
        obj_player.hsp = -4;
        obj_player.state = states.tackle;
    }
    
    bounce = true;
}

if (place_meeting(x + 5, y, obj_player) && obj_player.dir != 1 && bounce == false)
{
    vsp = -9;
    hsp = -7;
    
    if (obj_player.character != "G")
    {
        obj_player.vsp = -4;
        obj_player.hsp = 4;
        obj_player.state = states.tackle;
    }
    
    bounce = true;
}

if (place_meeting(x, y + 1, obj_player) && bounce == false)
{
    vsp = -9;
    hsp = 0;
    obj_player.vsp = 4;
    obj_player.state = states.bump;
    bounce = true;
}

if (place_meeting(x - 5, y, obj_spike) && !scr_sound(sound_destroyblock1))
{
    repeat (6)
        instance_create(x, y, obj_wooddebris);
    
    scr_sound(sound_destroyblock1);
    instance_create(x - 32, y - 32, obj_keyeffect);
    instance_create(x - 32, y - 32, obj_key);
    instance_destroy();
}

if (place_meeting(x, y + 1, obj_tomatoblock))
    vsp = -16;

if (place_meeting(x, y + 1, obj_railh2))
    hsp = 5;

if (place_meeting(x, y + 1, obj_railh))
    hsp = -5;

scr_collide();
