if (level == "HUB")
{
    if (distance_to_object(obj_player) < 16)
    {
        with (obj_tv)
        {
            message = "";
            showtext = 0;
        }
    }
}

if (level == "DESERT")
{
    if (distance_to_object(obj_player) < 16)
    {
        with (obj_tv)
        {
            message = "Wasteland Mirage";
            showtext = 1;
            alarm[0] = 2;
        }
    }
}

if (sprite_index == spr_gate_badland && gate_badland == 0)
{
    gate_badland = 1;
    var gatebg = instance_create(x, y, obj_gatebg);
    gatebg.sprite_index = spr_gate_badland;
    gatebg.image_index = 1;
}

if (level == "MANSION")
{
    if (distance_to_object(obj_player) < 16)
    {
        with (obj_tv)
        {
            message = "Meatball Manor";
            showtext = 1;
            alarm[0] = 2;
            message2 = "Currently in the works";
            showtext2 = 1;
            alarm[0] = 2;
        }
    }
}

if (level == "FREEZER")
{
    if (distance_to_object(obj_player) < 16)
    {
        with (obj_tv)
        {
            message = "Winterly Wonders";
            showtext = 1;
            alarm[0] = 2;
            message2 = "Has some rooms done.";
            showtext2 = 1;
            alarm[0] = 2;
        }
    }
}

if (level == "GOLF")
{
    if (distance_to_object(obj_player) < 16)
    {
        with (obj_tv)
        {
            message = "Golf";
            showtext = 1;
            alarm[0] = 2;
            message2 = "Not reworked.";
            showtext2 = 1;
            alarm[0] = 2;
        }
    }
}

if (level == "FACTORY")
{
    if (distance_to_object(obj_player) < 16)
    {
        with (obj_tv)
        {
            message = "Pep. Industries";
            showtext = 1;
            alarm[0] = 2;
            message2 = "Not reworked.";
            showtext2 = 1;
            alarm[0] = 2;
        }
    }
}

if (sprite_index == spr_gate_industrial && gate_industrial == 0)
{
    gate_industrial = 1;
    var gatebg = instance_create(x, y, obj_gatebg);
    gatebg.sprite_index = spr_gate_industrial;
    gatebg.image_index = 1;
}

if (level == "SEWER")
{
    if (distance_to_object(obj_player) < 16)
    {
        with (obj_tv)
        {
            message = "Tubular Trash Zone";
            showtext = 1;
            alarm[0] = 2;
            message2 = "Not reworked.";
            showtext2 = 1;
            alarm[0] = 2;
        }
    }
}

if (sprite_index == spr_gate_sewer && gate_sewer == 0)
{
    gate_sewer = 1;
    var gatebg = instance_create(x, y, obj_gatebg);
    gatebg.sprite_index = spr_gate_sewer;
    gatebg.image_index = 1;
}
