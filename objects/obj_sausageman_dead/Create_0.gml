vsp = random_range(-5, -10);
hsp = sign(x - obj_player.x) * random_range(5, 10);
grav = 0.4;
angle = 0;
alarm[0] = 5;
depth = -1;
cigar = 0;
scale = 1;
stomped = 0;

if (x != obj_player.x)
    image_xscale = -sign(x - obj_player.x);
