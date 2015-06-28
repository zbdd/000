control = argument0;
TEST_CASUALTIES = 2
control.dangers = 2;

//var analyse = instance_create(x, y, o_analysis) for testing purposes

var player = instance_create(
    max(o_service_start.x, irandom(x + o_service_start.sprite_width)),
    max(o_service_start.y, irandom(y + o_service_start.sprite_height)), o_player)
    
if (!instance_exists(control.objects)) ds_list_add(control.objects, player)
else player = instance_find(o_player, instance_number(o_player))

var attempt = 0
for (idx = 0; idx < TEST_CASUALTIES; idx++) {

    too_close = false
    idd = ds_list_size(control.objects) - 1
    
    if (attempt > 10) { // remove the last one if we can't fit in the next
        ds_list_delete(control.objects, idd)
        
        with (control.objects[| idd]) {
            instance_destroy()
        }  
        attempt = 0
    }
    x = max(o_casualty_start.x, irandom(x + o_casualty_start.sprite_width))
    y = max(o_casualty_start.y, irandom(y + o_casualty_start.sprite_height))
    var casualty = s_create_casualty(
                        x, 
                        y,
                        'casualty' + string(idx + 1),
                        'default description')
    
    for(i = 0; i < ds_list_size(control.objects); i++) {
        if (distance_to_object(control.objects[| i]) < 70)
            too_close = true
    }
    if (!too_close) {
        ds_list_add(control.objects, casualty);
        attempt = 0
    } else {
        with (casualty) { instance_destroy() }
        idx--
        attempt++
    }
}
