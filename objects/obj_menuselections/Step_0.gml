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
global.key_up = ini_read_string("ControlsKeys", "up", vk_up);
global.key_right = ini_read_string("ControlsKeys", "right", vk_right);
global.key_left = ini_read_string("ControlsKeys", "left", vk_left);
global.key_down = ini_read_string("ControlsKeys", "down", vk_down);
global.key_jump = ini_read_string("ControlsKeys", "jump", ord("Z"));
global.key_slap = ini_read_string("ControlsKeys", "slap", ord("X"));
global.key_taunt = ini_read_string("ControlsKeys", "taunt", ord("C"));
global.key_shoot = ini_read_string("ControlsKeys", "shoot", ord("A"));
global.key_attack = ini_read_string("ControlsKeys", "attack", vk_shift);
global.key_start = vk_escape;
global.key_upC = ini_read_string("ControllerButton", "up", gp_padu);
global.key_rightC = ini_read_string("ControllerButton", "right", gp_padr);
global.key_leftC = ini_read_string("ControllerButton", "left", gp_padl);
global.key_downC = ini_read_string("ControllerButton", "down", gp_padd);
global.key_jumpC = ini_read_string("ControllerButton", "jump", gp_face1);
global.key_slapC = ini_read_string("ControllerButton", "slap", gp_face3);
global.key_tauntC = ini_read_string("ControlsKeys", "taunt", gp_face2);
global.key_shootC = ini_read_string("ControllerButton", "shoot", gp_face4);
global.key_attackC = ini_read_string("ControllerButton", "attack", gp_shoulderr);
global.key_startC = gp_start;
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
