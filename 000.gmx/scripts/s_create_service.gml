type = argument0
service_for = ds_list_create()

for (idx = 0; idx < instance_number(o_casualty); idx++) {
    casualty = instance_find(o_casualty, idx)

    for (idy = 0; idy < ds_list_size(casualty.problems); idy++) {

        to_match = casualty.problems[| idy]
        if (to_match == 'phys' || to_match == 'psych') to_match = 'police'
            
        if (to_match == type) {
            ds_list_delete(casualty.problems, idy) // resolve current problem
            ds_list_delete(casualty.actions, ds_list_find_index(casualty.actions, type)) //stops problem re-appearing
            
            switch (type) {
                case 'elec':
                    man = instance_create(casualty.x - 16, casualty.y, o_service)
                    man.sprite_index = spr_elec
                break;
                
                case 'env':
                    man = instance_create(casualty.x - 16, casualty.y, o_service)
                break;
                    
                case 'police':
                    man = instance_create(casualty.x - 16, casualty.y, o_service)
                break;
            }
        }
    }
}



