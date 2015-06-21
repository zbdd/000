control = argument0;
TEST_CASUALTIES = 3

var player = instance_create(x, y, o_player)
if (!instance_exists(control.objects)) ds_list_add(control.objects, player)
else player = instance_find(o_player, instance_number(o_player))

for (idx = 0; idx < TEST_CASUALTIES; idx++) {
    show_debug_message(idx)
    var casualty = s_create_casualty(max(irandom(view_wview[0] - 20), 20), 
                        max(irandom(view_hview[0] - 20), 20),
                        'casualty' + string(idx + 1),
                        'default description')
    ds_list_add(control.objects, casualty);
}

/*var vehicle_1 = instance_create(x, y, o_vehicle);
vehicle_1.x = max(irandom(view_wview[0] - 20), 20);
vehicle_1.y = max(irandom(view_hview[0] - 20), 20);
vehicle_1.name = 'white toyota'
casualty_2.danger = vehicle_1
ds_list_add(control.objects, vehicle_1);*/