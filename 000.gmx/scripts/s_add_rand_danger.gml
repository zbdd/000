// The p is for possible :P

p_state = ds_list_create()
p_state[| 0] = 'inactive'
p_state[| 1] = 'active'
p_state[| 2] = 'resolved'

p_text = ds_list_create()
p_text[| 0] = 'a live wire from a downed power pole is near by'
p_text[| 1] = 'the casualty is muttering under their breath about hurting themselves'
p_text[| 2] = 'a petrol like substance surrounds the casualty'

p_type = ds_list_create()
p_type[| 0] = 'phys'
p_type[| 1] = 'elec'
p_type[| 2] = 'psych'
p_type[| 3] = 'env'

danger = instance_create(x, y, o_danger);
danger.state = p_state[| irandom(ds_list_size(p_state) - 1)]
danger.text = p_text[| irandom(ds_list_size(p_text) - 1)]
danger.type = p_type[| irandom(ds_list_size(p_type) - 1)]

return danger
