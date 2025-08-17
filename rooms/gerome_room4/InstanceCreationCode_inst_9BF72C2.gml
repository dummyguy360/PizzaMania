global.randomRoom = random_range(0, 4);

if (global.randomRoom < 2)
{
    targetRoom = gerome_room3;
    target_x = 128;
    target_y = 112;
}

if (global.randomRoom > 1)
{
    targetRoom = gerome_room5;
    target_x = 128;
    target_y = 80;
}

if (global.randomRoom > 2)
{
    targetRoom = gerome_room6;
    target_x = 96;
    target_y = 96;
}

if (global.randomRoom > 3)
{
    targetRoom = gerome_room7;
    target_x = 128;
    target_y = 432;
}
