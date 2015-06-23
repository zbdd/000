p_state = ds_list_create()
p_state[| 0] = 'inactive'
p_state[| 1] = 'active'
p_state[| 2] = 'resolved'

type = ds_grid_create(4,2)
type[# 0, 0] = 'phys'
type[# 1, 0] = 'elec'
type[# 2, 0] = 'psych'
type[# 3, 0] = 'env'

// phys
type[# 0, 1] = 'a drunken man is swinging a broken glass aggressively'

// elec
type[# 1, 1] = 'a live wire from a downed power pole is near by'

// psych
type[# 2, 1] = 'the casualty is muttering under their breath about hurting themselves'

// env
type[# 3, 1] = 'a petrol like substance surrounds the casualty'

danger = instance_create(x, y, o_danger);
danger.state = p_state[| irandom(ds_list_size(p_state) - 1)]

danger_type = irandom(ds_grid_width(type) - 1)
danger.text = type[# danger_type, irandom_range(1, ds_grid_height(type) - 1)]
danger.type = type[# danger_type, 0]

show_debug_message(danger.type)
if (danger.type == 'env') show_debug_message(danger.text)

return danger
