if (instance_exists(obj_keyconfig))
    visible = false;
else
    visible = true;

var offset = sin(current_time / 100) * 2;

if (fading == 1)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

ini_open("saveData.ini");
global.key_up = ini_read_string("ControlsKeys", "up", 38);
global.key_right = ini_read_string("ControlsKeys", "right", 39);
global.key_left = ini_read_string("ControlsKeys", "left", 37);
global.key_down = ini_read_string("ControlsKeys", "down", 40);
global.key_jump = ini_read_string("ControlsKeys", "jump", 90);
global.key_slap = ini_read_string("ControlsKeys", "slap", 88);
global.key_taunt = ini_read_string("ControlsKeys", "taunt", 67);
global.key_shoot = ini_read_string("ControlsKeys", "shoot", 65);
global.key_attack = ini_read_string("ControlsKeys", "attack", 16);
global.key_start = 27;
global.key_upC = ini_read_string("ControllerButton", "up", 32781);
global.key_rightC = ini_read_string("ControllerButton", "right", 32784);
global.key_leftC = ini_read_string("ControllerButton", "left", 32783);
global.key_downC = ini_read_string("ControllerButton", "down", 32782);
global.key_jumpC = ini_read_string("ControllerButton", "jump", 32769);
global.key_slapC = ini_read_string("ControllerButton", "slap", 32771);
global.key_tauntC = ini_read_string("ControlsKeys", "taunt", 32770);
global.key_shootC = ini_read_string("ControllerButton", "shoot", 32768);
global.key_attackC = ini_read_string("ControllerButton", "attack", 32774);
global.key_startC = 32778;
ini_close();

if (levelselect == 1)
{
    obj_rockcutscene.hspeed = -15;
    fading = 1;
    
    if (instance_exists(obj_cursor))
        obj_cursor.fading = 1;
    
    if (instance_exists(obj_title))
        obj_title.fading = 1;
    
    if (instance_exists(obj_controls))
        obj_controls.fading = 1;
    
    with (obj_fadeout)
        gotonoplayer = 1;
}
else if (levelselect == 0)
{
    if (!instance_exists(obj_keyconfig))
        scr_getinput();
    
    if (key_up && !instance_exists(obj_keyconfig) && optionselect == 1)
    {
        optionselect = 0;
        scr_sound(sound_points);
    }
    else if (key_down && !instance_exists(obj_keyconfig) && optionselect == 0)
    {
        optionselect = 1;
        scr_sound(sound_points);
    }
    
    if (optionselect == 0)
    {
        obj_cursor.y = y - 26;
        obj_cursor.x = (x + offset) - 128;
    }
    else if (optionselect == 1)
    {
        obj_cursor.y = y + 18;
        obj_cursor.x = (x + offset) - 128;
    }
    
    if (optionselect == 0 && key_jump && !instance_exists(obj_keyconfig))
    {
        scr_sound(sound_pizzagot);
        levelselect = 1;
        sprite_index = spr_null;
    }
    
    if (optionselect == 1 && !instance_exists(obj_keyconfig))
    {
        if (keyboard_check_pressed(global.key_jump))
        {
            scr_sound(sound_pizzagot);
            instance_create(x, y, obj_keyconfig);
        }
        else if (gamepad_button_check_pressed(0, global.key_jumpC))
        {
            scr_sound(sound_pizzagot);
            
            with (instance_create(x, y, obj_keyconfig))
                controller = 1;
        }
    }
}
