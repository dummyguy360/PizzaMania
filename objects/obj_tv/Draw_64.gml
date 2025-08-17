draw_set_alpha(text_alpha);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);

if (message != prev_message)
{
    msg1_cached = string_hash_to_newline(message);
    prev_message = message;
}

if (message2 != prev_message2)
{
    msg2_cached = string_hash_to_newline(message2);
    prev_message2 = message2;
}

if (message3 != prev_message3)
{
    msg3_cached = string_hash_to_newline(message3);
    prev_message3 = message3;
}

var scale1 = 1;
var spacing1 = 17;
var char_base1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:";
var base_char_w1 = sprite_get_width(spr_font) / string_length(char_base1);
var char_w1 = base_char_w1 * scale1;
var total_w1 = string_length(msg1_cached) * (char_w1 + spacing1);
var draw_x1 = xi - (total_w1 / 2);
var draw_y1 = (room != Tutorialtrap) ? yi : (yi - 25);

for (var i = 1; i <= string_length(msg1_cached); i++)
{
    var ch = string_char_at(msg1_cached, i);
    draw_text_transformed(draw_x1, draw_y1, ch, scale1, scale1, 0);
    draw_x1 += (char_w1 + spacing1);
}

draw_set_alpha(text_alpha2);
var scale2 = 0.8;
var spacing2 = 15;
var char_w2 = base_char_w1 * scale2;
var total_w2 = string_length(msg2_cached) * (char_w2 + spacing2);
var draw_x2 = xi2 - (total_w2 / 2);
var draw_y2 = yi2 - 33;

for (var i = 1; i <= string_length(msg2_cached); i++)
{
    var ch = string_char_at(msg2_cached, i);
    draw_text_transformed(draw_x2, draw_y2, ch, scale2, scale2, 0);
    draw_x2 += (char_w2 + spacing2);
}

draw_set_alpha(1);
draw_set_font(font2);
draw_sprite(spr_namebg, 0, xiname - 185, yiname - 25);
var scale3 = 1;
var spacing3 = 9;
var char_w3 = base_char_w1 * scale3;
var total_w3 = string_length(msg3_cached) * (char_w3 + spacing3);
var draw_x3 = (xiname + 10) - (total_w3 / 2);
var draw_y3 = yiname + 12;

for (var i = 1; i <= string_length(msg3_cached); i++)
{
    var ch = string_char_at(msg3_cached, i);
    draw_text_transformed(draw_x3, draw_y3, ch, scale3, scale3, 0);
    draw_x3 += (char_w3 + spacing3);
}

draw_set_alpha(1);

if (room != Titlescreen && room != hub_room1 && room != hub_desert && room != hub_room0 && room != Tutorialtrap && room != gerome_room1 && room != gerome_room2 && room != gerome_room3 && room != gerome_room4 && room != gerome_room5 && room != gerome_room6 && room != gerome_room7 && global.playerhealth > 0)
{
    draw_sprite_ext(tvsprite, -1, 832, 74, 1, 1, 1, c_white, alpha);
    draw_set_font(global.normalfont);
    
    if (global.combo != 0 && global.combotime != 0 && (tvsprite == spr_tvdefault || tvsprite == spr_tvcombo))
    {
        var msg_combo = string_hash_to_newline(global.combo);
        var draw_y_combo = 75;
        var draw_x_combo = 852;
        var scale_combo = 1;
        var total_combo_w = 0;
        
        for (var i = 1; i <= string_length(msg_combo); i++)
        {
            var ch = string_char_at(msg_combo, i);
            total_combo_w += ((string_width(ch) * scale_combo) - 10);
        }
        
        draw_x_combo -= (total_combo_w * 0.5);
        
        for (var i = 1; i <= string_length(msg_combo); i++)
        {
            var ch = string_char_at(msg_combo, i);
            draw_text_transformed(draw_x_combo, draw_y_combo, ch, scale_combo, scale_combo, 0);
            draw_x_combo += ((string_width(ch) * scale_combo) - 10);
        }
    }
    
    if (tvsprite == spr_tvdefault)
    {
        chose = 0;
        
        if (room != boss_room1)
        {
            var msg_collect = string_hash_to_newline(global.collect);
            var total_collect_w = string_length(msg_collect) * (char_w1 + spacing1);
            var draw_x_collect = 842 - (total_collect_w * 0.5);
            var draw_y_collect = 60;
            
            for (var i = 1; i <= string_length(msg_collect); i++)
            {
                var ch = string_char_at(msg_collect, i);
                draw_text_transformed(draw_x_collect, draw_y_collect, ch, scale1, scale1, 0);
                draw_x_collect += (char_w1 + spacing1);
            }
        }
    }
    
    if (instance_exists(obj_pizzaball))
    {
        var msg_golf = string_hash_to_newline(string(global.golfhit) + " GOLF HITS");
        var total_golf_w = string_length(msg_golf) * (char_w1 + spacing1);
        var draw_x_golf = 832 - (total_golf_w * 0.5);
        var draw_y_golf = 300;
        
        for (var i = 1; i <= string_length(msg_golf); i++)
        {
            var ch = string_char_at(msg_golf, i);
            draw_text_transformed(draw_x_golf, draw_y_golf, ch, scale1, scale1, 0);
            draw_x_golf += (char_w1 + spacing1);
        }
    }
}
