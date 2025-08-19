if (obj_player.y < y && obj_player.state != states.hurt && obj_player.attacking == false)
{
    if (obj_player.key_jump2 && obj_player.y < y && obj_player.vsp > 0)
    {
        bounce = true;
        image_index = 0;
        audio_sound_gain(sound_superjump, 0.7, 0);
        audio_play_sound(sound_superjump, 1, false);
        
        if (!obj_player.key_up)
            obj_player.vsp = -11;
        
        if (obj_player.key_up)
        {
            obj_player.state = states.machfreefall;
            obj_player.vsp = -14;
        }
        
        instance_create(obj_player.x, obj_player.y + 40, obj_stompeffect);
    }
    else
    {
        obj_player.vsp = -11;
        bounce = true;
        image_index = 0;
        audio_sound_gain(sound_superjump, 0.7, 0);
        audio_play_sound(sound_superjump, 1, false);
    }
}

if (obj_player.mach2 >= 35 || obj_player.attacking == true)
{
    if (obj_player.state == states.facestomp)
    {
        obj_player.vsp = -6;
        obj_player.image_index = 0;
        obj_player.facestompAnim = true;
    }
    
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    instance_destroy();
    
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_anchodead;
    
    global.combo += 1;
    global.combotime = 60;
    global.style += 10;
    global.stylelock = 10;
    
    with (obj_camera)
    {
        shake_mag = 10;
        shake_mag_acc = 20 / room_speed;
    }
    
    audio_sound_gain(sound_combo1, 0.7, 0);
    audio_play_sound(sound_combo1, 1, false);
}
