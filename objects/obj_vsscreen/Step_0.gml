if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (pepx != 0)
    pepx += 5;
else if (flashed == 0)
{
    flash = true;
    flashed = 1;
}

if (noisex != 545)
    noisex -= 5;

flamey -= 4;

if (vsy != 0)
    vsy += 5;

shake = random_range(-1, 1);
