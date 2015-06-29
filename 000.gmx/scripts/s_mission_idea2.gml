control = argument0;

var player = instance_create(
    max(o_service_start.x, irandom(x + o_service_start.sprite_width)),
    max(o_service_start.y, irandom(y + o_service_start.sprite_height)), o_player)

if (!instance_exists(control.objects)) ds_list_add(control.objects, player)
else player = instance_find(o_player, instance_number(o_player))
    
var spawner = instance_create(x, y, o_casualty_spawner)
