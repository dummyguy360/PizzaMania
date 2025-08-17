if (instance_exists(obj_keyconfig))
{
    if (room != Tutorialtrap || room != hub_room0)
        visible = false;
    else
        visible = true;
}

if (room == hub_room0 || room == hub_room1)
{
    if (x != obj_player.x)
        image_xscale = -sign(x - obj_player.x);
}

if (fading)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (room == hub_room0)
{
    sprite_index = spr_gerome_idle1;
    
    if (place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
            if (key_up2)
                other.dialogue += 1;
        }
        
        with (obj_tv)
        {
            if (other.dialogue == 0)
                message = "Psst.";
            
            if (other.dialogue == 1)
            {
                if (obj_player.character == "P")
                    message = "Hey. You.\nItalian man.";
                else if (obj_player.character == "N")
                    message = "Hey. You. Little... thing.";
                else if (obj_player.character == "V")
                    message = "Hey. You. Tough slime guy.";
                else if (obj_player.character == "M")
                    message = "Hey. You. Big weirdo.";
            }
            
            if (other.dialogue == 2)
                message = "I've heard a lot of bad things about this tower...";
            
            if (other.dialogue == 3)
                message = "If you're going to explore it...";
            
            if (other.dialogue == 4)
                message = "Make sure you know what you're doing.";
            
            if (other.dialogue == 5)
                message = "Also. I've lost some of my snacks around here.";
            
            if (other.dialogue == 6)
                message = "If you could find them for me...";
            
            if (other.dialogue == 7)
                message = "Maybe I could give you a little reward.";
            
            if (other.dialogue == 8)
                message = "Now go away. Let me enjoy the silence.";
            
            if (other.dialogue == 9)
                message = "";
            
            showtext = 1;
            alarm[0] = 2;
        }
    }
}

if (room == hub_room1)
{
    sprite_index = spr_ranch_idle;
    
    if (place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
            if (key_up2)
                other.dialogue += 1;
        }
        
        with (obj_tv)
        {
            if (other.dialogue == 0)
                message = "Hey.";
            
            if (other.dialogue == 1)
                message = "This tower has been quiet for quite long.";
            
            if (other.dialogue == 2)
                message = "It kind of makes me wonder...";
            
            if (other.dialogue == 3)
                message = "Why would you visit it?";
            
            if (other.dialogue == 4)
                message = "This question may remain unanswered.";
            
            if (other.dialogue == 5)
                message = "";
            
            showtext = 1;
            alarm[0] = 2;
        }
    }
}

if (distance_to_object(obj_player) < 64 && sprite_index == spr_bootsnpc)
    global.chartheme = 1;
else
    global.chartheme = 0;
