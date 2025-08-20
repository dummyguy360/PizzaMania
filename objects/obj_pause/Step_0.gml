if (!pause)
{
    if (obj_player.key_start && room != Realtitlescreen && room != rank_room && room != timesuproom)
    {
        pause = 1;
        audio_pause_sound(obj_music.currentlyplaying);
        instance_deactivate_all(true);
        instance_create(__view_get(e__VW.XView, 0) + 500, (__view_get(e__VW.YView, 0) + 270) - 0, obj_exit);
        instance_create(__view_get(e__VW.XView, 0) + 500, (__view_get(e__VW.YView, 0) + 270) - 50, obj_retry);
    }
    else
    {
        instance_destroy(obj_exit);
        instance_destroy(obj_retry);
        pause = 0;
        instance_activate_all();
    }
}

if (pause == 1)
{
    if (!audio_is_playing(music_pause))
        scr_sound(music_pause);
}
else
    audio_stop_sound(music_pause);

if (pause == 1)
{
    application_surface_draw_enable(true);
    scr_getinput();
    
    if (key_down2 && obj_exit.selected == 0)
    {
        obj_exit.selected = 1;
        obj_retry.selected = 0;
    }
    
    if (key_up2 && obj_retry.selected == 0)
    {
        obj_exit.selected = 0;
        obj_retry.selected = 1;
    }
    
    if (instance_exists(obj_retry))
    {
        if (key_jump && obj_exit.selected == 1)
        {
            global.lap = 1;
            global.geromerooms = 0;
            game_restart();
        }
        
        if (key_jump && obj_retry.selected == 1)
        {
            instance_destroy(obj_exit);
            instance_destroy(obj_retry);
            pause = 0;
            instance_activate_all();
        }
    }
}
