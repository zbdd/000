casualty = argument0
box = instance_create(casualty.x, casualty.y - 10, o_info_box);
box.name = casualty.name;
box.my_health = casualty.my_health;
box.state = casualty.state;
box.effect = casualty.effect;
// TODO fix this
box.mugshot = casualty.sprite_index;
box.mugshot_extra = casualty.image_index;

return box;