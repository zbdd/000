control = argument0;

var player = instance_create(
    max(o_service_start.x, irandom(x + o_service_start.sprite_width)),
    max(o_service_start.y, irandom(y + o_service_start.sprite_height)), o_player)

if (!instance_exists(control.objects)) ds_list_add(control.objects, player)
else player = instance_find(o_player, instance_number(o_player)-1)
    
var spawner = instance_create(x, y, o_casualty_spawner)

instance_create(256, 128, o_store)
instance_create(416, 160, o_store)
instance_create(320, 224, o_store)
instance_create(480, 256, o_store)
instance_create(320, 320, o_fap)

instance_create(x, y, o_sick_controller);
