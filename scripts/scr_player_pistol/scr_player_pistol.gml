function scr_player_pistol()
{
	if (handstand == 0)
	{
	    hsp = xscale * movespeed;
	    move = key_left + key_right;
	    jumpAnim = 1;
	    dashAnim = 1;
	    landAnim = 0;
	    moveAnim = 1;
	    stopAnim = 1;
	    crouchslideAnim = 1;
	    crouchAnim = 1;
    
	    if (move != 0)
	    {
	        if (movespeed < 8)
	            movespeed += 0.1;
	    }
    
	    if (move == 0)
	    {
	        if (movespeed > 0)
	            movespeed -= 0.1;
	    }
    
	    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_crouchshoot && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair && !key_down && move == 0)
	        state = states.normal;
    
	    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_crouchshoot && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair && !key_down && move != 0 && mach2 < 100)
	    {
	        if (mach2 > 35)
	        {
	            image_index = 0;
	            sprite_index = spr_mach1;
            
	            if (movespeed < 10)
	                movespeed = 10;
            
	            state = states.mach2;
	        }
	        else
	        {
	            state = 0;
	        }
	    }
    
	    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_crouchshoot && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair && !key_down && move != 0 && mach2 > 99)
	    {
	        image_index = 0;
	        sprite_index = spr_mach1;
	        state = states.mach3;
	    }
	    else if (floor(image_index) == (image_number - 1) && key_down && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair)
	    {
	        state = states.crouch;
	    }
	    else if (grounded && vsp > 0 && global.was_grounded == 1)
	    {
	        sprite_index = spr_playerV_revolverslide;
	        global.was_grounded = 0;
	        state = states.crouchslide;
	    }
    
	    if (shoot == 1 && floor(image_index) == 0 && (sprite_index == spr_playerV_revolvershoot || sprite_index == spr_playerV_airrevolver))
	    {
	        with (obj_camera)
	        {
	            shake_mag = 8;
	            shake_mag_acc = 30 / room_speed;
	        }
        
	        with (instance_create(x + (xscale * 10), y - 5, obj_pistoleffect))
	            image_xscale = other.xscale;
        
	        var box;
        
	        if (xscale == 1)
	            box = bbox_right;
	        else
	            box = bbox_left;
        
	        var ID = instance_create(box + (xscale * 10), y, obj_pistolbullet);
	        ID.hspeed = xscale * 15;
	        shoot = 0;
	    }
    
	    if (shoot == 1 && floor(image_index) == 0 && sprite_index == spr_player_crouchshoot)
	    {
	        with (obj_camera)
	        {
	            shake_mag = 8;
	            shake_mag_acc = 30 / room_speed;
	        }
        
	        with (instance_create(x + (xscale * 10), y + 16, obj_pistoleffect))
	            image_xscale = other.xscale;
        
	        var box;
        
	        if (xscale == 1)
	            box = bbox_right;
	        else
	            box = bbox_left;
        
	        var ID = instance_create(box + (xscale * 10), y + 20, obj_pistolbullet);
	        ID.hspeed = xscale * 15;
	        shoot = 0;
	    }
    
	    if (shoot == 1 && floor(image_index) == 0 && sprite_index == spr_player_shootup)
	    {
	        with (obj_camera)
	        {
	            shake_mag = 8;
	            shake_mag_acc = 30 / room_speed;
	        }
        
	        with (instance_create(x + (-xscale * 10), y - 10, obj_pistoleffect))
	        {
	            sprite_index = spr_pistoleffectup;
	            image_xscale = other.xscale;
	        }
        
	        var box = bbox_top;
	        var ID = instance_create(x + (-xscale * 16), box, obj_pistolbullet);
	        ID.vspeed = -15;
	        shoot = 0;
	    }
    
	    if (shoot == 1 && floor(image_index) == 0 && sprite_index == spr_player_shootdiagonal)
	    {
	        with (obj_camera)
	        {
	            shake_mag = 8;
	            shake_mag_acc = 30 / room_speed;
	        }
        
	        with (instance_create(x, y - 10, obj_pistoleffect))
	        {
	            if (other.xscale == 1)
	                image_angle = -60;
	            else
	                image_angle = 60;
            
	            sprite_index = spr_pistoleffectup;
	            image_xscale = other.xscale;
	        }
        
	        var box = bbox_top;
	        var ID = instance_create(x + (-xscale * 5), box + 12, obj_pistolbullet);
	        ID.vspeed = -15;
	        ID.hspeed = xscale * 15;
	        shoot = 0;
	    }
    
	    if (key_shoot && !grounded && floor(image_index) == (image_number - 1))
	    {
	        image_index = 0;
	        sprite_index = spr_playerV_airrevolver;
	        shoot = 1;
	    }
    
	    if (floor(image_index) != (image_number - 1))
	        image_speed = 0.45;
	    else
	        image_speed = 0;
	}

	if (handstand == 1)
	{
	    hsp = xscale * movespeed;
	    move = key_left + key_right;
	    jumpAnim = 1;
	    dashAnim = 1;
	    landAnim = 0;
	    moveAnim = 1;
	    stopAnim = 1;
	    crouchslideAnim = 1;
	    crouchAnim = 1;
    
	    if (move != 0)
	    {
	        if (movespeed < 8)
	            movespeed += 0.1;
	    }
    
	    if (move == 0)
	    {
	        if (movespeed > 0)
	            movespeed -= 0.1;
	    }
    
	    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_crouchshoot && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair && !key_down && move == 0)
	        state = states.normal;
    
	    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_crouchshoot && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair && !key_down && move != 0 && mach2 < 100)
	    {
	        if (mach2 > 35)
	        {
	            image_index = 0;
	            sprite_index = spr_mach1;
            
	            if (movespeed < 10)
	                movespeed = 10;
            
	            state = states.mach2;
	        }
	        else
	        {
	            state = 0;
	        }
	    }
    
	    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_crouchshoot && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair && !key_down && move != 0 && mach2 > 99)
	    {
	        image_index = 0;
	        sprite_index = spr_mach1;
	        state = states.mach3;
	    }
    
	    if (shoot == 1 && floor(image_index) == 0 && sprite_index == spr_playerV_dynamitethrow)
	    {
	        with (instance_create(x + (xscale * 10), y - 5, obj_pistoleffect))
	            image_xscale = other.xscale;
        
	        var box;
        
	        if (xscale == 1)
	            box = bbox_right;
	        else
	            box = bbox_left;
        
	        var ID = instance_create(box + (xscale * 10), y, obj_pistolbullet);
        
	        if (movespeed != 0)
	            ID.hspeed = 1 * xscale * movespeed;
	        else
	            ID.hspeed = 6 * xscale;
        
	        shoot = 0;
	    }
	}
}