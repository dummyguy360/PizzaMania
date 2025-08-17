pal_swap_init_system(shd_pal_swapper);

with (obj_tv)
{
    message3 = "GEROMES QUEST";
    showtext3 = 1;
    alarm[1] = 150;
}

with (obj_player)
{
    state = states.normal;
    character = "G";
    scr_characterspr();
}
