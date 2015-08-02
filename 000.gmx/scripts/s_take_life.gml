source = argument0
//from = argument1

if (source.my_health >= 3) source.my_health--
//from.my_health--

source.event = instance_create(source.x, source.y, o_event);
source.event.sprite_index = spr_sick
source.event.image_speed = 0.1
