if (fading)
{
    image_alpha -= 0.01;
    vspeed -= 0.1;
    image_xscale -= 0.001;
    image_yscale += 0.001;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (!fading)
{
    var bpm = 102;
    var bounce_scale = 0.002;
    var base_scale = 0.4;
    var beat_interval = 60 / bpm;
    var time = current_time / 1000;
    var beat_phase = frac(time / beat_interval);
    var pulse = sin(beat_phase * 2 * pi);
    pulse = max(0, pulse);
    var new_xscale = base_scale + (pulse * bounce_scale);
    var new_yscale = base_scale + (pulse * bounce_scale);
    var dx = sprite_width * (new_xscale - prev_xscale) * 0.5;
    var dy = sprite_height * (new_yscale - prev_yscale) * 0.5;
    x -= dx;
    y -= dy;
    image_xscale = new_xscale;
    image_yscale = new_yscale;
    prev_xscale = new_xscale;
    prev_yscale = new_yscale;
    var bob_speed = 2;
    var bob_amplitude = 10;
    var bob_offset = sin((current_time / 1000) * bob_speed) * bob_amplitude;
    y = base_y + bob_offset;
}
