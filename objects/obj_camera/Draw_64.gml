display_set_gui_size(960, 540);
scroll_x -= 2;
scroll_y += 1;

if (global.curchar != "G")
{
    if (obj_player.y < 200 && obj_player.x < 200)
        alpha = 0.5;
    else
        alpha = 1;
}

if (global.curchar == "G")
{
    if (obj_player.x > 700)
        alpha = 0.5;
    else
        alpha = 1;
}

draw_set_alpha(alpha);
pal_swap_set(spr_peppalette, obj_player.paletteselect, 0);
var hp = 8 - clamp(global.playerhealth, 0, 8);
draw_sprite_ext(spr_pizzahealthbar, hp, 100, 80, 1, 1, 0, c_white, alpha);

if (obj_player.state != states.gameover)
{
    var st = obj_player.state;
    var sp = obj_player.sprite_index;
    var idle_intro = st == states.bossintro && (sp == spr_player_bossintro || sp == spr_player_idle);
    var victory_state = sp == spr_player_victory || st == states.keyget || st == states.smirk || st == states.gottreasure || (st == states.bossintro && sp == spr_player_levelcomplete);
    var mach1 = st == states.mach1 || st == states.shotgun || st == states.chainsaw || st == states.freefallprep || st == states.freefall || st == states.tackle || st == states.Sjump || st == states.slam || st == states.Sjumpprep || st == states.grab || st == states.punch || st == states.backbreaker || st == states.backkick || st == states.uppunch || st == states.shoulder;
    var stun = st == states.Sjumpland || (st == states.freefallland && shake_mag > 0);
    var mach2 = st == states.mach2;
    var mach3 = st == states.mach3 || st == states.machroll;
    var hurt = st == states.hurt || st == states.timesup || st == states.bombpep || idle_intro;
    
    if (obj_player.character == "P")
    {
        if (!(mach1 || mach2 || mach3 || victory_state || stun || hurt || st == states.smirk || st == states.keyget || st == states.gottreasure))
        {
            if (global.playerhealth == 1)
                draw_sprite_ext(spr_pepinoHUD1hp, -1, 150, 100, 1, 1, 1, c_white, alpha);
            else if (obj_player.angry == 1)
                draw_sprite_ext(spr_pepinoHUD3hp, -1, 150, 100, 1, 1, 1, c_white, alpha);
            else
                draw_sprite_ext(spr_pepinoHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (stun)
        {
            draw_sprite_ext(spr_pepinoHUDstun, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (victory_state)
        {
            draw_sprite_ext(spr_pepinoHUDhappy, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach1)
        {
            draw_sprite_ext(spr_pepinoHUDmach1, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach2)
        {
            draw_sprite_ext(spr_pepinoHUDmach2, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach3)
        {
            draw_sprite_ext(spr_pepinoHUDmach3, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (hurt)
        {
            draw_sprite_ext(spr_pepinoHUDhurt, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
    }
    
    if (obj_player.character == "N")
    {
        if (!(mach1 || mach2 || mach3 || victory_state || stun || hurt || st == states.smirk || st == states.keyget || st == states.gottreasure))
        {
            if (global.playerhealth == 1)
                draw_sprite_ext(spr_noiseHUD_lowhealth, -1, 150, 100, 1, 1, 1, c_white, alpha);
            else if (obj_player.angry == 1)
                draw_sprite_ext(spr_noiseHUD_angry, -1, 150, 100, 1, 1, 1, c_white, alpha);
            else
                draw_sprite_ext(spr_noiseHUD_idle, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (stun)
        {
            draw_sprite_ext(spr_noiseHUD_hurt, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (victory_state)
        {
            draw_sprite_ext(spr_noiseHUD_happy, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach1)
        {
            draw_sprite_ext(spr_noiseHUD_mach1, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach2)
        {
            draw_sprite_ext(spr_noiseHUD_mach2, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach3)
        {
            draw_sprite_ext(spr_noiseHUD_mach3, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (hurt)
        {
            draw_sprite_ext(spr_noiseHUD_hurt, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
    }
    
    if (obj_player.character == "V")
    {
        if (!(mach1 || mach2 || mach3 || victory_state || stun || hurt || st == states.smirk || st == states.keyget || st == states.gottreasure))
        {
            if (global.playerhealth == 1)
                draw_sprite_ext(spr_playerV_angryHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
            else if (obj_player.angry == 1)
                draw_sprite_ext(spr_playerV_angryHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
            else
                draw_sprite_ext(spr_playerV_normalHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (stun)
        {
            draw_sprite_ext(spr_playerV_hurtHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (victory_state)
        {
            draw_sprite_ext(spr_playerV_happyHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach1)
        {
            draw_sprite_ext(spr_playerV_machHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach2)
        {
            draw_sprite_ext(spr_playerV_machHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (mach3)
        {
            draw_sprite_ext(spr_playerV_machHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
        else if (hurt)
        {
            draw_sprite_ext(spr_playerV_hurtHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
        }
    }
    
    if (obj_player.character == "M")
        draw_sprite_ext(spr_peppermanHUD, -1, 150, 100, 1, 1, 1, c_white, alpha);
    
    if (obj_player.character == "G")
        draw_sprite_ext(spr_geromeHUD, -1, 732, 382, 1, 1, 1, c_white, alpha);
    
    shader_reset();
    
    if (obj_player.character != "G")
    {
        var m = obj_player.mach2;
        var index = (m < 7) ? 0 : ((m < 35) ? 1 : ((m < 50) ? 2 : ((m < 75) ? 3 : ((m < 100) ? 4 : -1))));
        
        if (index != -1)
            draw_sprite_ext(spr_speedbar, index, 150, 140, 1, 1, 1, c_white, alpha);
        else
            draw_sprite_ext(spr_speedbarmax, -1, 150, 140, 1, 1, 1, c_white, alpha);
    }
    
    draw_set_alpha(1);
    font = obj_tv.font;
    draw_set_font(font);
    draw_set_halign(fa_center);
    
    if (timestop == 0)
    {
        var time_str = (global.seconds < 10) ? (string(global.minutes) + ":0" + string(global.seconds)) : (string(global.minutes) + ":" + string(global.seconds));
        draw_set_color((global.minutes < 1) ? c_red : c_white);
        var scale1 = 1;
        var spacing1 = 18;
        var char_w1 = ((sprite_get_width(spr_creditsfont) / string_length("ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz.:!¡0123456789?'\"ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜáäãàâéèêëíìîïóöõôòúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнльœ«»+ß")) * scale1) + spacing1;
        var total_w1 = string_length(time_str) * char_w1;
        var base_x = 480 + random_range(-1, 1);
        var base_y = 65 + random_range(-1, 1);
        var draw_x1 = base_x - (total_w1 * 0.5);
        
        for (var i = 1; i <= string_length(time_str); i++)
        {
            var ch = string_char_at(time_str, i);
            draw_text_transformed(draw_x1, base_y, ch, scale1, scale1, 0);
            draw_x1 += char_w1;
        }
        
        var icon_spacing = 5;
        var sprite_x = draw_x1 + icon_spacing;
        var bounce_speed = 0.01;
        var bounce_height = 2;
        var time_offset = current_time * bounce_speed;
        var sprite_y = base_y + (sin(time_offset) * bounce_height);
        draw_sprite(spr_clockcollectible2, 0, sprite_x + 20, sprite_y + 15);
    }
}

if (global.key_inv == 1)
{
    draw_sprite_ext(spr_key, -1, 50, 30, 1, 1, 1, c_white, alpha);
    draw_sprite_ext(spr_inv, -1, 50, 30, 1, 1, 1, c_white, alpha);
}

if (string_pos("floor5_room", room_get_name(room)) == 1)
{
    offset_x = scroll_x % sprite_get_width(bg_freezer2);
    offset_y = scroll_y % sprite_get_height(bg_freezer2);
    draw_sprite_tiled(bg_freezer2, 0, offset_x, offset_y);
}
