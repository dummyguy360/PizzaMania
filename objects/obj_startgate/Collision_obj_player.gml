var tx = target_x;
var ty = target_y;
var tr = targetRoom;

if (instance_exists(obj_player))
{
    with (obj_player)
    {
        if (global.moveset == 2)
        {
            if (key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor && other.sprite_index == spr_exitgate && character != "N")
            {
                mach2 = 0;
                obj_camera.chargecamera = 0;
                ds_list_add(global.saveroom, id);
                image_index = 0;
                
                with (instance_create(x - 32, y - 32, obj_sausageman_dead))
                    sprite_index = spr_player_deathend;
                
                scr_sleep(5);
                tile_layer_delete_at(1, x, y);
                tile_layer_delete_at(1, x + 32, y);
                tile_layer_delete_at(1, x + 32, y + 32);
                tile_layer_delete_at(1, x, y + 32);
                ds_list_add(global.saveroom, id);
                instance_create(x, y, obj_bangeffect);
                
                if (tauntsound == 0)
                {
                    scr_sound(sound_explosion);
                    tauntsound = 1;
                }
                
                character = "N";
                scr_characterspr();
                state = states.victory;
                global.curchar = "N";
            }
            
            if (key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor && (other.sprite_index != spr_exitgate || character == "N"))
            {
                mach2 = 0;
                obj_camera.chargecamera = 0;
                ds_list_add(global.saveroom, id);
                image_index = 0;
                state = states.victory;
            }
        }
        
        if (grounded && key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3 || (state == states.Sjumpprep && global.moveset == 1)) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor)
        {
            audio_stop_all();
            obj_music.jingle = 1;
            mach2 = 0;
            obj_camera.chargecamera = 0;
            ds_list_add(global.saveroom, id);
            image_index = 0;
            state = states.victory;
        }
    }
}

if (floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == states.victory)
{
    with (obj_player)
    {
        player_x = tx;
        player_y = ty;
        targetRoom = tr;
        tauntsound = 0;
        
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout);
    }
}
