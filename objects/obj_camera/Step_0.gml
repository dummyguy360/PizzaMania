display_set_gui_size(960, 540);
visible = !(room == rank_room || room == timesuproom || room == Realtitlescreen || room == Titlescreen || room == Tutorialtrap || room == hub_room1 || room == hub_desert || room == hub_room0);

if (!instance_exists(obj_stylebar) && global.hardmode == 1)
    instance_create(x, y, obj_stylebar);

timestop = (global.panic == true || room == timesuproom) ? 0 : 1;

if (global.panic == true)
{
    if (global.seconds == 0 && global.minutes == 0 && !instance_exists(obj_endlevelfade))
    {
        obj_player.state = states.timesup;
        obj_player.image_index = 0;
        room_goto(timesuproom);
    }
    
    if (global.seconds < 0)
    {
        global.seconds = 59;
        global.minutes -= 1;
    }
    else if (global.seconds > 59)
    {
        global.seconds -= 60;
        global.minutes += 1;
    }
    
    if (global.minutes < 1 || obj_player.sprite_index == spr_player_timesup || basement == 0)
    {
        shake_mag = 2;
        shake_mag_acc = 3 / room_speed;
    }
}

if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc;
    
    if (shake_mag < 0)
        shake_mag = 0;
}

if (instance_exists(obj_player) && obj_player.state != states.timesup && obj_player.state != states.gameover)
{
    var target = obj_player;
    var view_w = __view_get(e__VW.WView, 0);
    var view_h = __view_get(e__VW.HView, 0);
    var desired_charge = 0;
    
    if (target.movespeed > 17)
        desired_charge = target.xscale * 132;
    
    chargecamera = lerp(chargecamera, desired_charge, 0.01);
    var cx = (target.x - (view_w * 0.5)) + chargecamera;
    var cy = target.y - (view_h * 0.5);
    cx = clamp(cx, 0, room_width - view_w);
    cy = clamp(cy, 0, room_height - view_h);
    
    if (shake_mag > 0)
    {
        cx += irandom_range(-shake_mag, shake_mag);
        cy += irandom_range(-shake_mag, shake_mag);
    }
    
    __view_set(0, 0, cx);
    __view_set(1, 0, cy);
}
