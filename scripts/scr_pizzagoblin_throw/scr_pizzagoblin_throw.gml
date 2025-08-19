function scr_pizzagoblin_throw()
{
	if (!variable_global_exists("throw_frame"))
	{
		// What frame should the enemy be on to throw stuff
	    global.throw_frame = 0;
	    global.throw_frame[obj_pizzagoblin] = 2;
	    global.throw_frame[obj_cheeserobot] = 6;
	    global.throw_frame[obj_spitcheese] = 2;
	    global.throw_frame[obj_trash] = 2;
	    global.throw_frame[obj_invtrash] = 2;
	    global.throw_frame[obj_robot] = 2;
		
		// What sprite should the enemy go to when throwing
	    global.throw_sprite = spr_plug;
	    global.throw_sprite[obj_pizzagoblin] = spr_pizzagoblin_throwbomb;
	    global.throw_sprite[obj_cheeserobot] = spr_cheeserobot_attack;
	    global.throw_sprite[obj_spitcheese] = spr_spitcheese_spit;
	    global.throw_sprite[obj_trash] = spr_trash_throw;
	    global.throw_sprite[obj_invtrash] = spr_invtrash_throw;
	    global.throw_sprite[obj_robot] = spr_robot_attack;
		
		// How long before the enemy throws something again
	    global.reset_timer = 0;
	    global.reset_timer[obj_pizzagoblin] = 200;
	    global.reset_timer[obj_cheeserobot] = 200;
	    global.reset_timer[obj_trash] = 100;
	    global.reset_timer[obj_invtrash] = 100;
	    global.reset_timer[obj_robot] = 200;
	    global.reset_timer[obj_spitcheese] = 100;
	}

	// Stop moving
	hsp = 0;

	// Change speed if I'm touching a rail
	if (place_meeting(x, y + 1, obj_railh))
	    hsp = -5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = 5;

	// Check if bomb timer expired and I'm on the right animation frame
	if (bombreset == 0 && floor(image_index) == global.throw_frame[object_index])
	{
		// Set bomb timer and animation frame
	    bombreset = global.reset_timer[object_index];
	    sprite_index = global.throw_sprite[object_index];
    
		// Spawn the right projectile
	    switch (object_index)
	    {
	        case obj_pizzagoblin:
	            with (instance_create(x, y, obj_bomb))
	                hsp = other.image_xscale * 8;
            
	            break;
        
	        case obj_cheeserobot:
	            with (instance_create(x, y, obj_cheeseblob))
	            {
	                sprite_index = spr_cheeserobot_goop;
	                image_xscale = other.image_xscale;
	                hsp = other.image_xscale * 8;
	                vsp = 0;
	                grav = 0;
	            }
            
	            break;
        
	        case obj_spitcheese:
	            with (instance_create(x + (image_xscale * 6), y - 6, obj_spitcheesespike))
	            {
	                image_xscale = other.image_xscale;
	                hsp = other.image_xscale * 5;
	                vsp = -6;
	            }
            
	            break;
        
	        case obj_trash:
	        case obj_invtrash:
	            with (instance_create(x + (image_xscale * 6), y - 6, obj_cheeseball))
	            {
	                image_xscale = other.image_xscale;
	                hsp = other.image_xscale * 5;
	                vsp = -4;
	            }
            
	            break;
        
	        case obj_robot:
	            with (instance_create(x, y, obj_robotknife))
	            {
	                image_xscale = other.image_xscale;
	                hsp = other.image_xscale * 5;
	            }
            
	            break;
	    }
	}

	// If I'm standing then return to idle
	if (floor(image_index) == (image_number - 1) && grounded)
	{
	    state = states.idle;
	    image_index = 0;
	}

	// Bump away from enemies and one-way walls?
	if (!grounded && hsp < 0)
	    hsp += 0.1;
	else if (!grounded && hsp > 0)
	    hsp -= 0.1;

	image_speed = 0.35 * global.baddieimagespeed;
}