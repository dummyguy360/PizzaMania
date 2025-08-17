if (obj_player.character == "M" && obj_player.state == 83 && flying == 0)
{
    scr_sound(sound_combo1);
    global.golfhit += 1;
    flying = 1;
    hsp = 16 * obj_player.xscale;
    vsp = -9;
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    instance_create(x, y + 30, obj_bangeffect);
    
    with (obj_camera)
    {
        shake_mag = 5;
        shake_mag_acc = 20 / room_speed;
    }
}
