casualty = argument0
box = instance_create(casualty.x, casualty.y - 10, o_info_box);
box.casualty = casualty;

return box;
