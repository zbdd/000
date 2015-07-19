type = argument0

switch (type) {
    case 'elec':
        man = instance_create(o_service_start.x, o_service_start.y, o_service)
        man.sprite_index = spr_elec
    break;
    
    case 'ambo':
        man = instance_create(o_service_start.x, o_service_start.y, o_service)
        man.sprite_index = spr_player
    break;
    
    case 'env':
        man = instance_create(o_service_start.x, o_service_start.y, o_service)
        man.sprite_index = spr_ses
    break;
        
    case 'police':
        if (instance_number(o_vehicle) == 0) {
            // not creating if we don't have a place for it
            if (!instance_exists(o_carpark)) break;
            else instance_create(
                max(o_carpark.x, irandom(x + o_carpark.sprite_width)),
                max(o_carpark.y, irandom(y + o_carpark.sprite_height)),
                o_vehicle)
        }
        man = instance_create(o_vehicle.x + 6, o_vehicle.y, o_service)
        man.go_to = casualty;
        man.vehicle = o_vehicle
    break;
}

return man
