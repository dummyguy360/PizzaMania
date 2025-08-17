pal_swap_init_system(shd_pal_swapper);

with (obj_tv)
{
    if (global.panic == 0)
        message3 = "SMELLS LIKE RAIN";
    else
        message3 = "SMELLS LIKE SMOKE";
    
    showtext3 = 1;
    alarm[1] = 150;
}
