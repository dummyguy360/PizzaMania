scr_getinput();

with (obj_player)
{
    switch (state)
    {
        case states.normal:
            scr_player_normal();
            break;
        
        case states.titlescreen:
            scr_player_titlescreen();
            break;
        
        case states.hookshot:
            scr_playerN_hookshot();
            break;
        
        case states.slap:
            scr_player_slap();
            break;
        
        case states.charge:
            scr_player_charge();
            break;
        
        case states.cheesepep:
            scr_player_cheesepep();
            break;
        
        case states.cheeseball:
            scr_player_cheeseball();
            break;
        
        case states.cheesepepstick:
            scr_player_cheesepepstick();
            break;
        
        case states.boxxedpep:
            scr_player_boxxedpep();
            break;
        
        case states.pistolaim:
            scr_player_pistolaim();
            break;
        
        case states.climbwall:
            scr_player_climbwall();
            break;
        
        case states.knightpepslopes:
            scr_player_knightpepslopes();
            break;
        
        case states.portal:
            scr_player_portal();
            break;
        
        case states.secondjump:
            scr_player_secondjump();
            break;
        
        case states.chainsawbump:
            scr_player_chainsawbump();
            break;
        
        case states.handstandjump:
            scr_player_handstandjump();
            break;
        
        case states.gottreasure:
            scr_player_gottreasure();
            break;
        
        case states.knightpep:
            scr_player_knightpep();
            break;
        
        case states.knightpepattack:
            scr_player_knightpepattack();
            break;
        
        case states.meteorpep:
            scr_player_meteorpep();
            break;
        
        case states.bombpep:
            scr_player_bombpep();
            break;
        
        case states.grabbing:
            scr_player_grabbing();
            break;
        
        case states.chainsawpogo:
            scr_player_chainsawpogo();
            break;
        
        case states.shotgunjump:
            scr_player_shotgunjump();
            break;
        
        case states.stunned:
            scr_player_stunned();
            break;
        
        case states.highjump:
            scr_player_highjump();
            break;
        
        case states.chainsaw:
            scr_player_chainsaw();
            break;
        
        case states.facestomp:
            scr_player_facestomp();
            break;
        
        case states.timesup:
            scr_player_timesup();
            break;
        
        case states.machroll:
            scr_player_machroll();
            break;
        
        case states.pistol:
            scr_player_pistol();
            break;
        
        case states.shotgun:
            scr_player_shotgun();
            break;
        
        case states.machfreefall:
            scr_player_machfreefall();
            break;
        
        case states.Throw:
            scr_player_throw();
            break;
        
        case states.superslam:
            scr_player_superslam();
            break;
        
        case states.slam:
            scr_player_slam();
            break;
        
        case states.skateboard:
            scr_player_skateboard();
            break;
        
        case states.grind:
            scr_player_grind();
            break;
        
        case states.grab:
            scr_player_grab();
            break;
        
        case states.punch:
            scr_player_punch();
            break;
        
        case states.backkick:
            scr_player_backkick();
            break;
        
        case states.uppunch:
            scr_player_uppunch();
            break;
        
        case states.shoulder:
            scr_player_shoulder();
            break;
        
        case states.backbreaker:
            scr_player_backbreaker();
            break;
        
        case states.bossdefeat:
            scr_player_bossdefeat();
            break;
        
        case states.bossintro:
            scr_player_bossintro();
            break;
        
        case states.smirk:
            scr_player_smirk();
            break;
        
        case states.pizzathrow:
            scr_player_pizzathrow();
            break;
        
        case states.gameover:
            scr_player_gameover();
            break;
        
        case states.Sjumpland:
            scr_player_Sjumpland();
            break;
        
        case states.freefallprep:
            scr_player_freefallprep();
            break;
        
        case states.runonball:
            scr_player_runonball();
            break;
        
        case states.boulder:
            scr_player_boulder();
            break;
        
        case states.keyget:
            scr_player_keyget();
            break;
        
        case states.tackle:
            scr_player_tackle();
            break;
        
        case states.slipnslide:
            scr_player_slipnslide();
            break;
        
        case states.ladder:
            scr_player_ladder();
            break;
        
        case states.jump:
            scr_player_jump();
            break;
        
        case states.victory:
            scr_player_victory();
            break;
        
        case states.comingoutdoor:
            scr_player_comingoutdoor();
            break;
        
        case states.Sjump:
            scr_player_Sjump();
            break;
        
        case states.Sjumpprep:
            scr_player_Sjumpprep();
            break;
        
        case states.crouch:
            scr_player_crouch();
            break;
        
        case states.crouchjump:
            scr_player_crouchjump();
            break;
        
        case states.crouchslide:
            scr_player_crouchslide();
            break;
        
        case states.mach1:
            scr_player_mach1();
            break;
        
        case states.mach2:
            scr_player_mach2();
            break;
        
        case states.mach3:
            scr_player_mach3();
            break;
        
        case states.machslide:
            scr_player_machslide();
            break;
        
        case states.bump:
            scr_player_bump();
            break;
        
        case states.hurt:
            scr_player_hurt();
            break;
        
        case states.freefall:
            scr_player_freefall();
            break;
        
        case states.freefallland:
            scr_player_freefallland();
            break;
        
        case states.hang:
            scr_player_hang();
            break;
        
        case states.door:
            scr_player_door();
            break;
        
        case states.barrelnormal:
            scr_player_barrelnormal();
            break;
        
        case states.barrelfall:
            scr_player_barrelfall();
            break;
        
        case states.barrelmach1:
            scr_player_barrelmach1();
            break;
        
        case states.barrelmach2:
            scr_player_barrelmach2();
            break;
        
        case states.barrelfloat:
            scr_player_barrelfloat();
            break;
        
        case states.barrelcrouch:
            scr_player_barrelcrouch();
            break;
        
        case states.barrelslipnslide:
            scr_player_barrelslipnslide();
            break;
        
        case states.barrelroll:
            scr_player_barrelroll();
            break;
        
        case states.current:
            scr_player_current();
            break;
    }
    
    if (key_up2 && key_taunt)
        global.showcollisions += 1;
    
    if (global.showcollisions > 1)
        global.showcollisions = 0;
    
    if (global.showcollisions == 1)
    {
        with (obj_solid)
        {
            if (object_index == obj_solid)
                visible = true;
        }
        
        with (obj_slope)
        {
            if (object_index == obj_slope)
                visible = true;
        }
        
        with (obj_platform)
        {
            if (object_index == obj_platform)
                visible = true;
        }
    }
    else
    {
        with (obj_solid)
        {
            if (object_index == obj_solid)
                visible = false;
        }
        
        with (obj_slope)
        {
            if (object_index == obj_slope)
                visible = false;
        }
        
        with (obj_platform)
        {
            if (object_index == obj_platform)
                visible = false;
        }
    }
    
    if (airtaunt > 0)
        airtaunt -= 0.025;
    
    if (instance_exists(obj_chargeeffect))
    {
        if ((state == states.mach3 && sprite_index != spr_dive) || (state == states.Sjump && sprite_index == spr_crazyrun) || (state == states.handstandjump && sprite_index == spr_Sjumpcancel))
            obj_chargeeffect.show = 1;
        else
            obj_chargeeffect.show = 0;
    }
    
    if (!instance_exists(obj_parrallax) && room != Realtitlescreen && room != Titlescreen && room != Tutorialtrap)
        instance_create(x, y, obj_parrallax);
    
    if (global.freezeframe == 0 && sprite_index != spr_knightpep_downslope && grounded && !(state == states.knightpep || state == states.unused117 || state == states.hookshot || state == states.unused120 || state == states.door || state == states.unused119 || state == states.climbwall || state == states.pizzathrow || state == states.barrelnormal || state == states.grind || state == states.tacklecharge))
    {
        var targetangle, RotationStep;
        
        if (abs(hsp) >= 8)
        {
            targetangle = scr_slopeangle();
            RotationStep = (((abs(hsp) / 16) + (abs(hsp) / 32)) - 2) * -1;
        }
        else
        {
            targetangle = 360;
            RotationStep = ((abs(hsp) / 16) - 2) * -1;
        }
        
        draw_angle = darctan2(dsin(targetangle) + (dsin(draw_angle) * RotationStep), dcos(targetangle) + (dcos(draw_angle) * RotationStep));
    }
    else if (global.freezeframe == 0)
    {
        if (draw_angle <= 0)
            draw_angle += 360;
        
        if (draw_angle < 180)
            draw_angle = max(draw_angle - 2.8125, 0);
        else
            draw_angle = min(draw_angle + 2.8125, 360);
        
        if (state == states.unused120 || state == states.knightpep)
            draw_angle = 0;
    }
    
    if (state == states.handstandjump && sprite_index == spr_Sjumpcancelstart)
    {
        vsp = 0;
        grav = 0;
    }
    else
        grav = 0.5;
    
    trail_timer++;
    
    if (((state == states.handstandjump && sprite_index != spr_Sjumpcancelstart) || (state == states.machfreefall && character == "N" && !grounded) || state == states.chainsaw || state == states.crouchslide || state == states.chainsawpogo || (state == states.Sjump && sprite_index == spr_crazyrun) || sprite_index == spr_dive || (sprite_index == spr_playerN_glide && state != states.mach2) || state == states.freefall) && (trail_timer % 4) == 0)
    {
        var t = instance_create(x, y, obj_trail);
        t.type = 1;
        t.sprite_index = sprite_index;
        t.image_index = image_index;
        t.image_xscale = xscale;
        t.image_yscale = image_yscale;
        t.image_angle = draw_angle;
        t.image_blend = c_white;
    }
    
    if (character == "G")
        global.curchar = "G";
    
    if (global.playerhealth <= 0 && state != states.gameover && character != "G")
    {
        image_index = 0;
        sprite_index = spr_deathstart;
        state = states.gameover;
    }
    
    if (global.playerhealth <= 0 && character == "G" && killreset == 0)
    {
        image_alpha = 0;
        cutscene = 1;
        grav = 0;
        vsp = 0;
        hsp = 0;
        killreset = 6;
        depth = 100000;
        mask_index = -1;
        
        if (!instance_exists(obj_sausageman_dead))
        {
            scr_sound(sound_combo1);
            
            with (instance_create(x - 32, y - 32, obj_sausageman_dead))
                sprite_index = spr_gerome_hurt;
        }
    }
    
    if (killreset > 0)
        killreset -= 0.05;
    
    if (killreset == 1)
        game_restart();
    
    if (state == states.gameover && sprite_index == spr_deathend && y > (room_height + 400))
        game_restart();
    
    if (!instance_exists(baddiegrabbedID) && (state == states.grab || (state == states.superslam && sprite_index != spr_piledriverland) || state == states.charge))
        state = states.normal;
    
    if (!(state == states.grab || state == states.superslam))
        baddiegrabbedID = obj_solid;
    
    if (grinding)
        state = states.grind;
    
    if (character == "P")
    {
        if (anger == 0)
            angry = 0;
        
        if (anger > 0)
        {
            angry = 1;
            anger -= 1;
        }
    }
    
    if (state == states.mach1 && grounded && character != "M")
    {
        if (!audio_is_playing(sound_dash1))
            scr_sound(sound_dash1);
    }
    else
        audio_stop_sound(sound_dash1);
    
    if ((state == states.mach2 && sprite_index != spr_dive) || (state == states.climbwall && mach2 < 100 && character != "N"))
    {
        if (!audio_is_playing(sound_dash2))
            scr_sound(sound_dash2);
    }
    else
        audio_stop_sound(sound_dash2);
    
    if (state == states.chainsaw)
    {
        if (!audio_is_playing(sound_chainsaw))
            scr_sound(sound_chainsaw);
    }
    else
        audio_stop_sound(sound_chainsaw);
    
    if ((state == states.mach3 && sprite_index != spr_dive) || (state == states.climbwall && mach2 == 100 && character != "N"))
    {
        if (character != "M")
        {
            if (!audio_is_playing(sound_maxspeed))
                scr_sound(sound_maxspeed);
        }
        else if (!audio_is_playing(sound_peppermanmach))
            scr_sound(sound_peppermanmach);
    }
    else
    {
        audio_stop_sound(sound_maxspeed);
        
        if (audio_is_playing(sound_peppermanmach))
            audio_stop_sound(sound_peppermanmach);
    }
    
    if (state == states.machroll)
    {
        if (!audio_is_playing(sound_machroll))
            scr_sound(sound_machroll);
    }
    else
        audio_stop_sound(sound_machroll);
    
    if (state == states.machslide && mach2 > 99)
    {
        if (character != "M")
        {
            if (!audio_is_playing(sound_machslideboost))
                scr_sound(sound_machslideboost);
        }
        else if (!audio_is_playing(sound_peppermanturn))
            scr_sound(sound_peppermanturn);
    }
    else
    {
        audio_stop_sound(sound_machslideboost);
        
        if (audio_is_playing(sound_peppermanturn))
            audio_stop_sound(sound_peppermanturn);
    }
    
    if (state == states.Sjump && sprite_index == spr_crazyrun)
    {
        if (!audio_is_playing(sound_noisejetpack))
            scr_sound(sound_noisejetpack);
    }
    else
        audio_stop_sound(sound_noisejetpack);
    
    if (state == states.handstandjump && handstand != 2)
    {
        if (!audio_is_playing(sound_suplexdash))
            scr_sound(sound_suplexdash);
    }
    else
        audio_stop_sound(sound_suplexdash);
    
    if (state == states.freefall || (state == states.chainsawpogo && sprite_index == spr_pepperman_groundpound && vsp > 0))
    {
        if (!audio_is_playing(sound_groundpoundloop))
            scr_sound(sound_groundpoundloop);
    }
    else
        audio_stop_sound(sound_groundpoundloop);
    
    if (state == states.grind || state == states.knightpepslopes)
    {
        if (!audio_is_playing(sound_knightslide))
            scr_sound(sound_knightslide);
    }
    else
        audio_stop_sound(sound_knightslide);
    
    if (sprite_index == spr_player_winding && state != states.normal)
        windingAnim = 0;
    
    if (state == states.Sjumpprep) { }
    else
        audio_stop_sound(sound_superjumpcharge2);
    
    if (suplexmove == 1 && scr_solid(x, y + 1))
    {
        suplexmove = 0;
        flash = 1;
    }
    
    if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
        instance_create(x + random_range(-5, 5), y + 46, obj_vomit);
    
    if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
    {
        with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
            sprite_index = spr_vomit2;
    }
    
    if (global.playerhealth == 1 && !instance_exists(obj_sweat) && obj_player.state == states.normal)
        instance_create(x, y, obj_sweat);
    
    if (angry == 1 && !instance_exists(obj_angrycloud) && obj_player.state == states.normal)
        instance_create(x, y, obj_angrycloud);
    
    if (global.combotime > 0 && global.moveset != 1)
        global.combotime -= 0.5;
    
    if (global.combotime == 0 && global.combo != 0)
        global.combo = 0;
    
    if (input_buffer_jump < 8)
        input_buffer_jump++;
    
    if (input_buffer_secondjump < 8)
        input_buffer_secondjump++;
    
    if (input_buffer_highjump < 8)
        input_buffer_highjump++;
    
    if (key_particles == 1)
        instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);
    
    if (inv_frames == 0 && hurted == 0)
        image_alpha = 1;
    
    if ((state == states.mach2 && sprite_index != spr_dive) || state == states.charge || state == states.skateboard || state == states.chainsaw || (state == states.handstandjump && (sprite_index == spr_player_hanstandjump || character == "V")) || state == states.knightpep || state == states.boxxedpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.machroll || (state == states.mach3 && sprite_index != spr_dive) || state == states.freefall || state == states.Sjump)
        attacking = 1;
    else
        attacking = 0;
    
    if (state == states.Throw || state == states.punch || state == states.backkick || state == states.shoulder || state == states.uppunch)
        grabbing = 1;
    else
        grabbing = 0;
    
    if ((state == states.mach3 && sprite_index != spr_dive) || state == states.chainsaw || state == states.chainsawpogo || state == states.hookshot || state == states.skateboard || state == states.mach4 || state == states.freefall || state == states.Sjump || state == states.machroll || (state == states.handstandjump && (sprite_index == spr_player_hanstandjump || character == "V")) || state == states.machfreefall || state == states.charge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.boxxedpep || state == states.cheesepep || (state == states.machslide && sprite_index == spr_machslideboost3) || state == states.cheeseball || (state == states.handstandjump && handstand != 0) || (state == states.crouchslide && character == "M") || (sprite_index == spr_dive && character == "M"))
        instakillmove = 1;
    else
        instakillmove = 0;
    
    if (flash == 1 && alarm[0] <= 0)
        alarm[0] = 0.15 * room_speed;
    
    if (state != states.mach3 && state != states.machslide)
        autodash = 0;
    
    if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
        fallinganimation = 0;
    
    if (state != states.freefallland && state != states.normal && state != states.machslide)
        facehurt = 0;
    
    if (state != states.normal && state != states.machslide)
        machslideAnim = 0;
    
    if (state != states.normal)
    {
        idle = 0;
        dashdust = 0;
    }
    
    if (state != states.mach1 && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
        momemtum = 0;
    
    if (state != states.Sjump && state != states.Sjumpprep)
        a = 0;
    
    if (state != states.facestomp)
        facestompAnim = 0;
    
    if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
        superslam = 0;
    
    if (state != states.mach2)
        machpunchAnim = 0;
    
    if (state != states.jump)
        ladderbuffer = 0;
    
    if (state != states.jump)
        stompAnim = 0;
    
    if (((state == states.mach3 && sprite_index != spr_dive) || (state == states.mach2 && sprite_index != spr_dive) || state == states.hookshot || (state == states.Sjump && sprite_index != spr_crazyrun) || state == states.machroll || state == states.charge || (state == states.machslide && mach2 >= 100)) && !instance_exists(obj_mach3effect))
    {
        toomuchalarm1 = 6;
        instance_create(x, y, obj_mach3effect);
    }
    
    if (toomuchalarm1 > 0)
    {
        toomuchalarm1 -= 1;
        
        if (toomuchalarm1 <= 0 && ((state == states.mach3 && sprite_index != spr_dive) || state == states.hookshot || (state == states.mach2 && sprite_index != spr_dive) || (state == states.Sjump && sprite_index != spr_crazyrun) || state == states.charge || (state == states.machslide && mach2 >= 100) || state == states.machroll))
        {
            instance_create(x, y, obj_mach3effect);
            toomuchalarm1 = 6;
        }
    }
    
    if (global.lap > 1)
    {
        with (obj_tv)
        {
            message2 = "Lap " + string(global.lap) + "!";
            showtext2 = 1;
        }
    }
    
    if (global.geromerooms > 0)
    {
        with (obj_tv)
        {
            message2 = string(global.geromerooms) + " " + "Rooms concluded";
            showtext2 = 1;
        }
    }
    
    if (state != states.bump && state != states.crouch && state != states.boxxedpep && state != states.pistol && sprite_index != spr_player_crouchshoot && state != states.Sjumpprep && state != states.machroll && state != states.hurt && state != states.crouchslide && state != states.crouchjump && sprite_index != spr_player_chainsawcrouch)
        mask_index = spr_player_mask;
    else
        mask_index = spr_crouchmask;
    
    if (state == states.gottreasure || sprite_index == spr_knightpep_start || sprite_index == spr_knightpep_thunder || sprite_index == spr_playerN_knightsword || sprite_index == spr_playerN_knightstart || state == states.keyget || state == states.door || state == states.victory || state == states.comingoutdoor || state == states.gameover)
        cutscene = 1;
    else
        cutscene = 0;
    
    if (state != states.hurt)
        hurtsound = 0;
    
    if ((place_meeting(x, y, obj_door) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == states.normal)
        instance_create(x, y, obj_uparrow);
    
    if (state == states.mach2 && !instance_exists(obj_speedlines))
        instance_create(x, y, obj_speedlines);
}

scr_collide_destructibles();

if (state != states.titlescreen && state != states.door && state != states.Sjump && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover)
    scr_collide_player();

if (state == states.boulder)
    scr_collide_player();

if ((place_meeting(x, y - 1, obj_outofscreen) || place_meeting(x, y + 1, obj_outofscreen) || place_meeting(x, y, obj_outofscreen)) && global.playerhealth > 0)
{
    mach2 = 0;
    handstand = 0;
    state = states.normal;
    y = global.last_y;
    x = global.last_x;
}

if (place_meeting(x, y, obj_flyingenemy) && mach2 <= 35)
{
    state = states.bump;
    vsp = -6;
    hsp = -4 * obj_player.xscale;
}
