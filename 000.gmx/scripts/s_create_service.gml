type = argument0
service_for = ds_list_create()

for (idx = 0; idx < instance_number(o_casualty); idx++) {
    casualty = instance_find(o_casualty, idx)

    for (idy = 0; idy < ds_list_size(casualty.problems); idy++) {

        to_match = casualty.problems[| idy]
        to_remove = to_match
        if (to_match == 'phys' || to_match == 'psych') to_match = 'police'
            
        if (to_match == type) {
            ds_list_delete(casualty.problems, idy) // resolve current problem
            for (idz = 0; idz < ds_list_size(casualty.actions); idz++) {
                if (casualty.actions[| idz].type == to_remove) ds_list_delete(casualty.actions, idz) //stops problem re-appearing
            }

            
            switch (type) {
                case 'elec':
                    man = instance_create(casualty.x - 16, casualty.y, o_service)
                    man.sprite_index = spr_elec
                break;
                
                case 'env':
                    man = instance_create(casualty.x - 16, casualty.y, o_service)
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
        }
    }
}
