pal_swap_init_system(shd_pal_swapper);
global.bgparalaxx = 0.25;
global.bgparalaxy = 1;

with (obj_tv)
{
    if (global.panic == false)
        message3 = "JOINING UNINVITED";
    else
        message3 = "LEAVING SO SOON?";
    
    showtext3 = 1;
    alarm[1] = 150;
}

if (global.last_y > 1300)
    global.last_y = 434;
