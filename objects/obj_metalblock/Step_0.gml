if (place_meeting(x, y + 1, obj_player) || place_meeting(x, y - 1, obj_player) || place_meeting(x - 1, y, obj_player) || place_meeting(x + 1, y, obj_player))
{
    if ((place_meeting(x + 1, y, obj_player) || place_meeting(x - 1, y, obj_player)) && (obj_player.state == states.mach3 || (obj_player.state == states.Sjump && obj_player.sprite_index == spr_playerN_crazyrun) || obj_player.state == states.knightpep || obj_player.state == states.knightpepslopes || obj_player.state == states.hookshot || (obj_player.state == states.chainsaw && obj_player.character == "N") || (obj_player.state == states.knightpep && obj_player.momemtum == 1)))
        instance_destroy();
    
    if (place_meeting(x, y - 1, obj_player) && (obj_player.state == states.knightpep || obj_player.state == states.hookshot || obj_player.state == states.chainsawpogo || (obj_player.state == states.freefallland && obj_player.falldamage == 5)))
    {
        instance_destroy();
        tile_layer_delete_at(1, x, y);
    }
    
    if ((place_meeting(x, y + 40, obj_player) && obj_player.state == states.Sjump) || (obj_player.state == states.turning && obj_player.falldamage == 5))
        instance_destroy();
}

var bullet = instance_place(x + 32, y, obj_pistolbullet);

if (bullet == -4)
    bullet = instance_place(x - 32, y, obj_pistolbullet);

if (bullet == -4)
    bullet = instance_place(x, y + 32, obj_pistolbullet);

if (bullet == -4)
    bullet = instance_place(x, y - 32, obj_pistolbullet);

if (bullet != -4 && bullet.dynamite == 1)
{
    with (bullet)
        instance_destroy();
    
    instance_destroy();
}
