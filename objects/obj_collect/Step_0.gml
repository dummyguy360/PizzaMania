if (global.collectsound < 10)
    global.collectsound += 1;

var dist = point_distance(x, y, obj_player.x, obj_player.y);

if (dist <= 64)
    follow = 1;

if (follow == 1)
{
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    var spd;
    
    if (obj_player.movespeed > 6)
        spd = obj_player.movespeed;
    else
        spd = 6;
    
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
}
