if (room == rank_room || room == timesuproom)
    visible = false;

if (obj_player.state == states.pizzathrow)
    visible = false;

if (sprite_index == spr_toppinsausage_intro && image_index >= (image_number - 1))
    intro = 0;

if (global.sausagefollow == true)
{
    if (!intro)
    {
        image_xscale = obj_player.xscale;
        image_alpha = obj_player.image_alpha;
        
        if (obj_player.hsp != 0)
            sprite_index = spr_toppinsausage_run;
        else
            sprite_index = spr_toppinsausage;
    }
    
    depth = -6;
    
    if (global.tomatofollow == true)
    {
        ds_queue_enqueue(followQueue, obj_pizzakintomato.x + (image_xscale * 4));
        ds_queue_enqueue(followQueue, obj_pizzakintomato.y - 2);
    }
    else if (global.cheesefollow == true)
    {
        ds_queue_enqueue(followQueue, obj_pizzakincheese.x + (image_xscale * 4));
        ds_queue_enqueue(followQueue, obj_pizzakincheese.y - 2);
    }
    else if (global.shroomfollow == true)
    {
        ds_queue_enqueue(followQueue, obj_pizzakinshroom.x + (image_xscale * 4));
        ds_queue_enqueue(followQueue, obj_pizzakinshroom.y - 2);
    }
    else
    {
        ds_queue_enqueue(followQueue, obj_player.x);
        ds_queue_enqueue(followQueue, obj_player.y);
    }
    
    LAG_STEPS = 10;
    
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        x = ds_queue_dequeue(followQueue) - (image_xscale * 4);
        y = ds_queue_dequeue(followQueue) + 2;
    }
}

if (global.playerhealth == 1 && global.sausagefollow == true)
    sprite_index = spr_pizzakinsausage_panic;
