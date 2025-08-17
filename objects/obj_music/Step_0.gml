with (obj_player)
{
    var _state = state;
    
    switch (_state)
    {
        case states.knightpep:
            other.pitch = 0.9;
            audio_sound_pitch(other.currentlyplaying, other.pitchslider);
            
            if (other.pitchslider < other.pitch)
                other.pitchslider += 0.05;
            
            if (other.pitchslider > other.pitch)
                other.pitchslider -= 0.05;
            
            break;
        
        case states.knightpepslopes:
            other.pitch = 1.2;
            audio_sound_pitch(other.currentlyplaying, other.pitchslider);
            
            if (other.pitchslider < other.pitch)
                other.pitchslider += 0.05;
            
            if (other.pitchslider > other.pitch)
                other.pitchslider -= 0.05;
            
            break;
        
        default:
            other.pitch = 1;
            audio_sound_pitch(other.currentlyplaying, other.pitchslider);
            
            if (other.pitchslider < other.pitch)
                other.pitchslider += 0.01;
            
            if (other.pitchslider > other.pitch)
                other.pitchslider -= 0.01;
    }
}

if (jingle == 0)
{
    if (room == Realtitlescreen)
        currentlyplaying = music_npc;
    
    if (room == Titlescreen || room == gerome_room1)
        currentlyplaying = music_outside;
    
    if (global.panic == 0)
    {
        switch (room)
        {
            case PP_room1:
                if (obj_player.character != "N")
                    currentlyplaying = music_funiculi;
                
                if (obj_player.character == "N")
                    currentlyplaying = music_lunchtime;
                
                break;
            
            case hub_room0:
                currentlyplaying = music_hub;
                break;
            
            case floor1_room0:
                if (global.curchar != "V")
                    currentlyplaying = music_desert;
                
                if (global.curchar == "V")
                    currentlyplaying = music_buffetfiesta;
                
                break;
            
            case floor2_room0:
                currentlyplaying = music_manor;
                break;
            
            case floor3_room0:
                currentlyplaying = music_factory1;
                break;
            
            case floor4_room0:
                if (global.curchar != "N")
                    currentlyplaying = music_sewer;
                
                if (global.curchar == "N")
                    currentlyplaying = music_sewerremix;
                
                break;
            
            case floor5_room1:
                currentlyplaying = music_freezer;
                break;
            
            case golf_room1:
                currentlyplaying = music_funiculi;
                break;
        }
        
        if (global.chartheme == 1)
        {
            playedbefore = currentlyplaying;
            currentlyplaying = music_npc;
        }
        
        if (instance_exists(obj_noise_pushbutton) && obj_player.sprite_index != spr_player_idle)
            currentlyplaying = music_knight;
        
        if (instance_exists(obj_noise_pushbutton))
        {
            if (obj_noise.hspeed != 0)
                currentlyplaying = music_noiseappear;
        }
    }
}

if (instance_exists(obj_player) && obj_player.state != 57 && room != rank_room && room != timesuproom && obj_player.state != 16 && obj_player.sprite_index != obj_player.spr_Timesup)
    jingle = 0;

if (global.panic == 1 && jingle == 0 && global.lap == 1 && obj_player.character == "P")
    currentlyplaying = music_pizzatime;

if (global.panic == 1 && jingle == 0 && global.lap > 1 && obj_player.character == "P")
    currentlyplaying = music_escapetheme2;

if (global.panic == 1 && jingle == 0 && global.lap == 1 && obj_player.character == "N")
    currentlyplaying = music_noiseescape;

if (global.panic == 1 && jingle == 0 && global.lap > 1 && obj_player.character == "N")
    currentlyplaying = music_escapeN;

if (global.panic == 1 && jingle == 0 && global.lap == 1 && obj_player.character == "V")
    currentlyplaying = music_escape3;

if (global.panic == 1 && jingle == 0 && global.lap > 1 && obj_player.character == "V")
    currentlyplaying = music_escape4;

if (global.panic == 1 && jingle == 0 && global.lap == 1 && obj_player.character == "M")
    currentlyplaying = music_escape3;

if (global.panic == 1 && jingle == 0 && global.lap > 1 && obj_player.character == "M")
    currentlyplaying = music_escape4;

if (global.panic == 1 && jingle == 0 && obj_player.character == "G")
    currentlyplaying = music_gerome;

if (jingle == 0)
{
    if (!audio_is_playing(currentlyplaying))
    {
        audio_stop_all();
        audio_play_sound(currentlyplaying, 1, false);
        audio_sound_pitch(currentlyplaying, sound_pitch);
    }
    
    if (audio_is_paused(currentlyplaying))
    {
        audio_pause_all();
        audio_resume_sound(currentlyplaying);
    }
}

if (room == rank_room)
{
    jingle = 1;
    audio_stop_sound(currentlyplaying);
    
    if (global.rank == "s")
    {
        if (!audio_is_playing(music_ranks))
            audio_play_sound(music_ranks, 1, false);
    }
    else if (global.rank == "a")
    {
        if (!audio_is_playing(music_ranka))
            audio_play_sound(music_ranka, 1, false);
    }
    else if (global.rank == "b" || global.rank == "c")
    {
        if (!audio_is_playing(music_rankb))
            audio_play_sound(music_rankb, 1, false);
    }
    else if (global.rank == "d")
    {
        if (!audio_is_playing(music_rankd))
            audio_play_sound(music_rankd, 1, false);
    }
}

if (room == timesuproom)
{
    audio_stop_all();
    jingle = 1;
}
