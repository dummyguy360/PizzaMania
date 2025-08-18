x = player_x;
y = player_y;

if (global.shroomfollow == true)
    instance_create(x, y, obj_pizzakinshroom);

if (global.cheesefollow == true)
    instance_create(x, y, obj_pizzakincheese);

if (global.tomatofollow == true)
    instance_create(x, y, obj_pizzakintomato);

if (global.sausagefollow == true)
    instance_create(x, y, obj_pizzakinsausage);

if (global.pineapplefollow == true)
    instance_create(x, y, obj_pizzakinpineapple);
