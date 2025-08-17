if (visited == 1)
    sprite_index = spr_doorvisited;

if (instance_exists(obj_noisesatellite))
    sprite_index = spr_doorblocked;

if (obj_player.character == "G" && obj_player.state == states.normal && room != gerome_room1)
{
    if (!instance_exists(obj_doorblocked))
    {
        with (obj_camera)
        {
            shake_mag = 20;
            shake_mag_acc = 40 / room_speed;
        }
        
        instance_destroy();
        instance_create(x, y, obj_doorblocked);
    }
}
