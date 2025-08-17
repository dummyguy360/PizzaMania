function scr_getinput()
{
	if (!variable_instance_exists(id, "cooldown"))
	    cooldown = 0;

	key_up = keyboard_check(global.key_up) || gamepad_button_check(0, global.key_upC) || keyboard_check(vk_up);
	key_up2 = keyboard_check_pressed(global.key_up) || gamepad_button_check_pressed(0, global.key_upC) || keyboard_check_pressed(vk_up);
	key_right = keyboard_check(global.key_right) || gamepad_button_check(0, global.key_rightC) || keyboard_check(vk_right);
	key_right2 = keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(0, global.key_rightC) || keyboard_check_pressed(vk_right);
	key_left = -(keyboard_check(global.key_left) || gamepad_button_check(0, global.key_leftC) || keyboard_check(vk_left));
	key_left2 = -(keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(0, global.key_leftC) || keyboard_check_pressed(vk_left));
	key_down = keyboard_check(global.key_down) || gamepad_button_check(0, global.key_downC) || keyboard_check(vk_down);
	key_down2 = keyboard_check_pressed(global.key_down) || gamepad_button_check_pressed(0, global.key_downC) || keyboard_check_pressed(vk_down);
	key_jump = keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(0, global.key_jumpC) || keyboard_check_pressed(ord("Z"));
	key_jump2 = keyboard_check(global.key_jump) || gamepad_button_check(0, global.key_jumpC) || keyboard_check(ord("Z"));
	key_slap = keyboard_check(global.key_slap) || gamepad_button_check(0, global.key_slapC) || keyboard_check(ord("X"));
	key_taunt = keyboard_check(global.key_taunt) || gamepad_button_check(0, global.key_tauntC) || keyboard_check(ord("C"));
	key_taunt2 = keyboard_check(global.key_taunt) || gamepad_button_check_pressed(0, global.key_tauntC) || keyboard_check(ord("C"));
	key_slap2 = keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(0, global.key_slapC) || keyboard_check_pressed(ord("X"));
	key_attack = keyboard_check(global.key_attack) || gamepad_button_check(0, global.key_attackC) || keyboard_check(vk_shift);
	key_attack2 = keyboard_check_pressed(global.key_attack) || gamepad_button_check_pressed(0, global.key_attackC) || keyboard_check_pressed(vk_shift);
	key_shoot = keyboard_check(global.key_shoot) || gamepad_button_check(0, global.key_shootC) || keyboard_check(ord("A"));
	key_shoot2 = keyboard_check_pressed(global.key_shoot) || gamepad_button_check_pressed(0, global.key_shootC) || keyboard_check_pressed(ord("A"));
	key_start = keyboard_check_pressed(global.key_start) || gamepad_button_check_pressed(0, global.key_startC) || keyboard_check_pressed(vk_enter);
	key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check(0, gp_select) || keyboard_check_pressed(vk_escape);
	gamepad_set_axis_deadzone(0, 0.5);

	if (keyboard_check(vk_f1) && obj_player.character == "P" && global.curchar == "P")
	{
	    with (instance_create(x - 32, y - 32, obj_sausageman_dead))
	    {
	        image_speed = 0.35;
	        sprite_index = spr_player_deathend;
	    }
    
	    ds_list_add(global.saveroom, id);
    
	    with (obj_player)
	    {
	        instance_create(x, y, obj_taunteffect);
	        character = "N";
	        scr_characterspr();
	        state = 44;
	        image_index = random_range(0, 7);
	        sprite_index = spr_taunt;
	    }
    
	    global.curchar = "N";
	}

	if (keyboard_check(vk_f2) && obj_player.character == "P" && global.curchar == "P")
	{
	    with (instance_create(x - 32, y - 32, obj_sausageman_dead))
	    {
	        image_speed = 0.35;
	        sprite_index = spr_player_deathend;
	    }
    
	    ds_list_add(global.saveroom, id);
    
	    with (obj_player)
	    {
	        instance_create(x, y, obj_taunteffect);
	        character = "V";
	        scr_characterspr();
	        state = 44;
	        image_index = random_range(0, 7);
	        sprite_index = spr_taunt;
	    }
    
	    global.curchar = "V";
	}

	if (keyboard_check(vk_f3) && obj_player.character == "P" && global.curchar == "P")
	{
	    with (instance_create(x - 32, y - 32, obj_sausageman_dead))
	    {
	        image_speed = 0.35;
	        sprite_index = spr_player_deathend;
	    }
    
	    ds_list_add(global.saveroom, id);
    
	    with (obj_player)
	    {
	        instance_create(x, y, obj_taunteffect);
	        character = "M";
	        scr_characterspr();
	        state = 44;
	        image_index = random_range(0, 7);
	        sprite_index = spr_taunt;
	    }
    
	    global.curchar = "M";
	}

	if (keyboard_check(vk_f4))
	    instance_create(obj_player.x, obj_player.y, obj_treasure);
}