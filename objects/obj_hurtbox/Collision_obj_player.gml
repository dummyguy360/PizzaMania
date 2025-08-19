with (obj_player)
{
    if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes) && cutscene == false)
        continue;
    
    if (state == states.bombpep && hurted == false)
        continue;
    
    if (state == states.boxxedpep)
        continue;
    
    if (state == states.cheesepep || state == states.cheesepepstick)
        continue;
    
    if (state != states.hurt && hurted == false && cutscene == false && state != states.bump)
    {
        scr_sound(sound_touchspike);
        
        if (character == "P")
        {
            var sounds = [va_hurt1, va_hurt2, va_hurt3];
            scr_sound(sounds[irandom(array_length_1d(sounds) - 1)]);
        }
        else if (character == "M")
        {
            var sounds = [va_pepperman_hurt1];
            scr_sound(sounds[irandom(array_length_1d(sounds) - 1)]);
        }
        
        global.hurtcounter += 1;
        alarm[8] = 60;
        alarm[7] = 120;
        hurted = true;
        
        if (xscale == other.image_xscale)
            sprite_index = spr_hurtjump;
        else
            sprite_index = spr_hurt;
        
        movespeed = 8;
        vsp = -5;
        timeuntilhpback = 300;
        
        if (global.collect > 100)
            global.collect -= 100;
        else
            global.collect = 0;
        
        if (global.collect != 0)
        {
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
            instance_create(x, y, obj_pizzaloss);
        }
        
        if (obj_player.shotgunAnim == false)
            global.playerhealth -= 1;
        else if (obj_player.shotgunAnim == true)
        {
            obj_player.shotgunAnim = false;
            
            with (instance_create(x, y, obj_knightdebris))
            {
                sprite_index = spr_shotgun;
                image_speed = 0.35;
            }
        }
        
        instance_create(x, y, obj_spikehurteffect);
        state = states.hurt;
        image_index = 0;
        flash = true;
    }
}
