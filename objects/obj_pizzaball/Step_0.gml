switch (state)
{
    case 86:
        scr_enemy_idle();
        break;
    
    case 88:
        scr_enemy_charge();
        break;
    
    case 90:
        scr_enemy_turn();
        break;
    
    case 94:
        scr_enemy_walk();
        break;
    
    case 96:
        scr_enemy_land();
        break;
    
    case 97:
        scr_enemy_hit();
        break;
    
    case 98:
        scr_enemy_stun();
        break;
    
    case 89:
        scr_pizzagoblin_throw();
        break;
    
    case 101:
        scr_enemy_grabbed();
        break;
}

if (state == 98 && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (flying > 0)
    flying -= 0.1;

if (state != 98)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hp != 5)
    hp = 5;

if (state != 101)
    depth = 0;

if (state != 98)
    thrown = 0;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}

if (place_meeting(x + obj_player.hsp, y, obj_player) && obj_player.character == "M" && obj_player.state == 83)
{
}
