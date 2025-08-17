image_alpha -= fade_speed;

if (image_alpha <= 0)
    instance_destroy();

if (type != 1)
    angle = 0;
