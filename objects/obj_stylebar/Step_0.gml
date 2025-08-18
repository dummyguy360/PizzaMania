if (obj_player.character != "G" || room != rank_room || room != Realtitlescreen || room != hub_room1)
{
    if (room == rank_room)
        visible = false;
    else
        visible = obj_camera.visible;
    
    var pop, idle;
    
	switch (global.stylethreshold)
    {
        case 0:
            pop = spr_mildpop;
            idle = spr_mild;
            break;
        
        case 1:
            pop = spr_antsypop;
            idle = spr_antsy;
            break;
        
        case 2:
            pop = spr_madpop;
            idle = spr_mad;
            break;
        
        case 3:
            pop = spr_crazypop;
            idle = spr_crazy;
            break;
    }
    
    if (global.style > 55 && global.stylethreshold < 3)
    {
        global.stylethreshold += 1;
        global.style -= 55;
        
        switch (global.stylethreshold)
        {
            case 1:
                global.baddieimagespeed = 1.25;
                global.baddiespeed = 1.5;
                
                with (obj_tv)
                {
                    message = "Heating up!!!";
                    showtext = 1;
                    alarm[0] = 150;
                }
                
                break;
            
            case 2:
                global.baddieimagespeed = 1.5;
                global.baddiespeed = 2;
                
                with (obj_tv)
                {
                    message = "Heating up!!!";
                    showtext = 1;
                    alarm[0] = 150;
                }
                
                break;
            
            case 3:
                global.baddieimagespeed = 2;
                global.baddiespeed = 3;
                
                with (obj_tv)
                {
                    message = "Max heat!!!";
                    showtext = 1;
                    alarm[0] = 150;
                }
                
                break;
        }
        
        switch (global.stylethreshold)
        {
            case 0:
                pop = spr_mildpop;
                idle = spr_mild;
                break;
            
            case 1:
                pop = spr_antsypop;
                idle = spr_antsy;
                break;
            
            case 2:
                pop = spr_madpop;
                idle = spr_mad;
                break;
            
            case 3:
                pop = spr_crazypop;
                idle = spr_crazy;
                break;
        }
        
        index = 0;
        sprite = pop;
    }
    
    if (global.style < 0 && global.stylethreshold != 0)
    {
        global.stylethreshold -= 1;
        global.style += 55;
        
        switch (global.stylethreshold)
        {
            case 0:
                with (obj_tv)
                {
                    global.baddieimagespeed = 1;
                    global.baddiespeed = 1;
                    message = "Heating down...";
                    showtext = 1;
                    alarm[0] = 150;
                }
                
                break;
            
            case 1:
                with (obj_tv)
                {
                    global.baddieimagespeed = 1.25;
                    global.baddiespeed = 1.5;
                    message = "Heating down...";
                    showtext = 1;
                    alarm[0] = 150;
                }
                
                break;
            
            case 2:
                with (obj_tv)
                {
                    global.baddieimagespeed = 1.5;
                    global.baddiespeed = 2;
                    message = "Heating down...";
                    showtext = 1;
                    alarm[0] = 150;
                }
                
                break;
        }
        
        switch (global.stylethreshold)
        {
            case 0:
                pop = spr_mildpop;
                idle = spr_mild;
                squish_scale = 0.05;
                break;
            
            case 1:
                pop = spr_antsypop;
                idle = spr_antsy;
                squish_scale = 0.1;
                break;
            
            case 2:
                pop = spr_madpop;
                idle = spr_mad;
                squish_scale = 0.2;
                break;
            
            case 3:
                pop = spr_crazypop;
                idle = spr_crazy;
                squish_scale = 0.3;
                break;
        }
        
        index = 0;
        sprite = pop;
    }
    
    if (sprite == pop && floor(index) == (sprite_get_number(sprite) - 1))
        sprite = idle;
    
    if (sprite == spr_crazypop || sprite == spr_crazy)
        obj_player.angry = 1;
    else
        obj_player.angry = 0;
    
    if (global.style < 0 && global.stylethreshold == 0)
        global.style = 0;
    
    if (global.stylethreshold == 3 && global.style > 55)
        global.style = 55;
    
    if (obj_player.y < 232)
        alpha = 0.5;
    else if (!(room == timesuproom || room == boss_room1 || room == Realtitlescreen))
        alpha = 1;
    
    index += 0.35;
    
    if (global.stylelock > 0)
        global.stylelock -= 0.05;
    
    if (global.stylelock == 0)
        global.style -= 0.01;
}
