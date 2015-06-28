mx = argument0
my = argument1
type = argument2
menu = ds_list_create()

for (idx = 0; idx < ds_list_size(type); idx++) {

    switch (type[| idx]) {
        case 'danger':
            ds_list_add(menu, instance_create(mx, my + (idx * 20), o_b_danger))
        break
        
        case 'look':
            ds_list_add(menu, instance_create(mx, my + (idx * 20), o_b_look))
        break;
    }
}

return menu
