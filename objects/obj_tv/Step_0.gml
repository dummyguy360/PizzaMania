display_set_gui_size(960, 540);
visible = !(room == rank_room || room == timesuproom || room == boss_room1 || room == Realtitlescreen || room == Titlescreen);

if (room == PP_room1)
    global.srank = 99999;
else if (room == floor1_room0)
    global.srank = 6500;
else if (room == floor2_room0)
    global.srank = 5000;
else if (room == floor3_room0)
    global.srank = 2300;
else if (room == floor4_room0)
    global.srank = 1480;
else if (room == floor5_room1)
    global.srank = 2430;
else if (room == golf_room1)
    global.srank = 3900;

global.arank = global.srank - (global.srank / 4);
global.brank = global.srank - (global.srank / 2);
global.crank = global.srank - ((global.srank * 3) / 4);

if (showtext)
{
    if (current_text != last_text)
    {
        text_alpha = 0;
        last_text = current_text;
    }
    
    xi = 500 + random_range(-1, 1);
    yi = 475;
    text_alpha = min(1, text_alpha + 0.05);
}
else
{
    xi = 500 + random_range(-1, 1);
    yi = 475;
    text_alpha = max(0, text_alpha - 0.05);
}

if (showtext2)
{
    xi2 = 500 + random_range(-1, 1);
    yi2 = 475;
    text_alpha2 = min(1, text_alpha2 + 0.05);
}
else
{
    xi2 = 500 + random_range(-1, 1);
    yi2 = 475;
    text_alpha2 = max(0, text_alpha2 - 0.05);
}

if (!(obj_player.state == states.knightpep || obj_player.state == states.knightpepattack || obj_player.state == states.knightpepslopes))
    once = 0;

if (obj_player.y < 200 && obj_player.x > (room_width - 200))
    alpha = 0.5;
else
    alpha = 1;

var handled = 0;

if (!handled && global.collect > global.arank && !shownranka)
{
    tvsprite = spr_tvranka;
    message = "You got enough for rank A!";
    showtext = 1;
    image_speed = 0;
    alarm[0] = 200;
    shownranka = 1;
    handled = 1;
}

if (!handled && global.collect > global.brank && !shownrankb)
{
    tvsprite = spr_tvrankb;
    message = "You got enough for rank B!";
    showtext = 1;
    image_speed = 0;
    alarm[0] = 200;
    shownrankb = 1;
    handled = 1;
}

if (!handled && global.collect > global.crank && !shownrankc)
{
    tvsprite = spr_tvrankc;
    message = "You got enough for rank C!";
    showtext = 1;
    image_speed = 0;
    alarm[0] = 200;
    shownrankc = 1;
    handled = 1;
}

if (!handled && obj_player.sprite_index == spr_player_levelcomplete)
{
    tvsprite = spr_tvclap;
    once = 1;
    chose = 1;
    image_speed = 0.1;
    alarm[0] = 50;
    handled = 1;
}

if (!handled && obj_player.state == states.hurt)
{
    tvsprite = spr_tvhurt;
    showtext = 1;
    
    if (chose == 0)
        message = choose("Ow!", "Ouch!", "Oh!", "Woh!");
    
    chose = 1;
    once = 1;
    image_speed = 0.1;
    alarm[0] = 50;
    handled = 1;
}

if (!handled && obj_player.state == states.timesup)
{
    tvsprite = spr_tvskull;
    image_speed = 0.1;
    alarm[0] = 50;
    handled = 1;
}

if (!handled && global.hurtcounter >= global.hurtmilestone)
{
    if (obj_player.character == "P")
        character = "Peppino";
    else if (obj_player.character == "N")
        character = "The Noise";
    else if (obj_player.character == "M")
        character = "Pepperman";
    else if (obj_player.character == "V")
        character = "Vigilante";
    else if (obj_player.character == "G")
        character = "Gerome";
    
    message = "You have hurt " + string(character) + " " + string(global.hurtmilestone) + " times...";
    
    if (tvsprite != spr_tvtalking1 && tvsprite != spr_tvtalking2 && tvsprite != spr_tvtalking3 && tvsprite != spr_tvtalking4)
        tvsprite = choose(spr_tvtalking1, spr_tvtalking2, spr_tvtalking3, spr_tvtalking4);
    
    global.hurtmilestone += 3;
    image_speed = 0.1;
    alarm[0] = 150;
    handled = 1;
}

if (!handled && obj_player.state == states.skateboard)
{
    tvsprite = spr_tvrad;
    message = "Sweet dude!!";
    once = 1;
    showtext = 1;
    alarm[0] = 50;
    handled = 1;
}

if (!handled && obj_player.state == states.slipnslide)
{
    tvsprite = spr_tvbanana;
    message = "Oops!!";
    once = 1;
    showtext = 1;
    alarm[0] = 50;
    handled = 1;
}

if (!handled && global.combo != 0 && global.combotime != 0 && (tvsprite == spr_tvdefault || tvsprite == spr_tvcombo || tvsprite == spr_tvescape))
{
    tvsprite = spr_tvcombo;
    image_speed = 0;
    imageindexstore = (global.combo >= 4) ? 3 : (global.combo - 1);
    handled = 1;
}

if (!handled && global.combotime == 0 && tvsprite == spr_tvcombo)
{
    tvsprite = spr_tvcomboresult;
    image_index = imageindexstore;
    alarm[0] = 50;
    handled = 1;
}

if (!handled && global.panic == 1)
{
    tvsprite = spr_tvescape;
    image_speed = 0.1;
    handled = 1;
}

if (!handled && obj_player.state == states.keyget)
{
    message = "Now go to the next floor!!";
    showtext = 1;
    alarm[0] = 50;
    handled = 1;
}

if (!handled && instance_exists(obj_noise_pushbutton) && obj_noise_pushbutton.hsp != 0 && global.panic == 0)
{
    message = "Uh oh...";
    showtext = 1;
    alarm[0] = 50;
    handled = 1;
}

if (showtext3)
    yiname = min(22, yiname + 5);
else
    yiname = max(-64, yiname - 1);
