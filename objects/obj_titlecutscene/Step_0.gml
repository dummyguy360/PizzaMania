ini_open("saveData.ini");
global.t1_rank = ini_read_string("Ranks", "t1", "none");
global.t2_rank = ini_read_string("Ranks", "t2", "none");
ini_close();
scr_getinput();

if (drop == 1)
    scr_collide();

if (drop == 1 && !instance_exists(obj_fadeout))
{
    with (instance_create(x, y, obj_fadeout))
        gotonoplayer = 1;
}

if (sprite_index == spr_pepcooter && !instance_exists(obj_superdashcloud))
    instance_create(x - 100, y, obj_superdashcloud);
