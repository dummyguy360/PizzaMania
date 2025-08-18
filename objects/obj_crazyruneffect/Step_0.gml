image_xscale = obj_player.xscale;

if (obj_player.movespeed <= 12 && obj_player.state != states.crouch)
    instance_destroy();
