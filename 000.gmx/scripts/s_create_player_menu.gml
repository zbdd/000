mx = argument0
my = argument1
menu = ds_list_create()

ds_list_add(menu, instance_create(mx, my, o_b_danger))
ds_list_add(menu, instance_create(mx, my + 20, o_b_elec))
ds_list_add(menu, instance_create(mx, my + 40, o_b_police))
ds_list_add(menu, instance_create(mx, my + 60, o_b_ses))

return menu