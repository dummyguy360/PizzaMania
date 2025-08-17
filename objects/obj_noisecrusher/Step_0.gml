switch (state)
{
    case 86:
        scr_enemy_idle();
        break;
    
    case 87:
        scr_enemy_bounce();
        break;
    
    case 98:
        scr_enemy_stun();
        break;
    
    case 101:
        scr_enemy_grabbed();
        break;
}

if (state == 98 && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != 98)
    birdcreated = 0;

if (state == 86 && obj_player.x != x)
    image_xscale = sign(obj_player.x - x);

if (state == 86)
    attack--;

if (attack <= 0 && state == 86)
{
    sprite_index = jumpprepspr;
    image_index = 0;
    state = 87;
}

if (global.bosshealth == 5)
    helmet = 1;

if (helmet == 0)
{
    idlespr = spr_noisecrusher_bounce;
    stunfallspr = spr_noisecrusher_stun;
    walkspr = spr_noisecrusher_bounce;
    grabbedspr = spr_noisecrusher_stun;
    jumpprepspr = 24;
    jumpspr = 22;
    landspr = spr_noisecrusher_land;
    airspr = 16;
}
else
{
    idlespr = spr_noisecrusherhelmet_bounce;
    stunfallspr = spr_noisecrusherhelmet_stun;
    walkspr = spr_noisecrusherhelmet_bounce;
    grabbedspr = spr_noisecrusherhelmet_stun;
    jumpprepspr = 23;
    jumpspr = 21;
    landspr = spr_noisecrusherhelmet_land;
    airspr = 15;
}

if (global.bosshealth <= 0)
    instance_destroy();

if (caughtplayer == 1 && !grounded)
{
    obj_player.state = 65;
    obj_player.image_index = 0;
    obj_player.x = x;
    obj_player.y = y;
}

if (caughtplayer == 1 && grounded)
{
    obj_player.state = 8;
    
    if (obj_player.sprite_index != spr_boxxedpep_intro)
    {
        obj_player.sprite_index = spr_boxxedpep_intro;
        scr_sound(sound_touchspike);
    }
    
    obj_player.image_index = 0;
    obj_player.hsp = 0;
    obj_player.vsp = 0;
    obj_player.x = x;
    obj_player.y = y - 20;
    caughtplayer = 0;
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != 101)
    depth = 0;

scr_collide();

if (state != 98)
    thrown = 0;
