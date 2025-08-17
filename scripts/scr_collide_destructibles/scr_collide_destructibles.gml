function scr_collide_destructibles()
{
	if (state == states.mach2 || state == states.mach3 || (state == states.Sjump && sprite_index == spr_playerN_crazyrun) || state == states.machfreefall || state == states.crouchslide || state == states.chainsaw || state == states.chainsawpogo || state == states.machroll || state == states.hookshot || state == states.knightpep || state == states.knightpepslopes || (state == states.handstandjump && sprite_index == spr_player_hanstandjump) || (state == states.machfreefall && global.moveset == 1))
	{
	    var inst_side = instance_place(x + hsp, y, obj_destructibles);
    
	    if (inst_side != noone)
	    {
	        with (inst_side)
	            instance_destroy();
	    }
	}

	if (state == states.knightpep || (state == states.Sjump && sprite_index == spr_playerN_crazyrun) || state == states.chainsawpogo || state == states.superslam || state == states.hookshot || (state == states.handstandjump && sprite_index == spr_player_hanstandjump))
	{
	    var inst_down = instance_place(x, y + 1, obj_destructibles);
    
	    if (inst_down != noone)
	    {
	        with (inst_down)
	            instance_destroy();
	    }
	}

	var plat = instance_place(x, y + 1, obj_destructibleplatform);

	if (plat != noone)
	{
	    with (plat)
	    {
	        falling = 1;
	        image_speed = 0.35;
	    }
	}

	if (state == states.jump || state == states.Sjump || state == states.climbwall || state == states.chainsawpogo || state == states.mach2 || state == states.mach3 || (state == states.Sjump && sprite_index == spr_playerN_crazyrun))
	{
	    var inst_up = instance_place(x, y - 1, obj_destructibles);
    
	    if (inst_up != noone)
	    {
	        with (inst_up)
	            instance_destroy();
	    }
	}

	if (state == states.handstandjump || (state == states.Sjump && sprite_index == spr_playerN_crazyrun))
	{
	    with (obj_destructibles)
	    {
	        if (place_meeting(x - obj_player.hsp, y, obj_player))
	            instance_destroy();
	    }
	}

	with (obj_baddie)
	{
	    if (thrown == 1)
	    {
	        var inst_right = instance_place(x + 1, y, obj_destructibles);
        
	        if (inst_right != noone)
	        {
	            instance_destroy(inst_right);
	            grav = 0.5;
	        }
        
	        var inst_left = instance_place(x - 1, y, obj_destructibles);
        
	        if (inst_left != noone)
	        {
	            instance_destroy(inst_left);
	            grav = 0.5;
	        }
	    }
	}
}