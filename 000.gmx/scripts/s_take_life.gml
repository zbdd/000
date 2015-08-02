source = argument0
//from = argument1

source.my_health--
//from.my_health--

event = instance_create(source.x, source.y, o_event);
event.sprite_index = spr_sick
event.image_speed = 0.1

return event;
