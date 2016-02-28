go_to = argument0
mover = argument1
attempt = 0;
radius = 10
force_break = 3;

do {
    tmp_waypoint = ds_list_create()
    for(ida = 0; ida < 361; ida+=10) {
        cx = go_to.x + (attempt * 10) + radius * cos(ida * pi / 180);
        cy = go_to.y + (attempt * 10) + radius * sin(ida * pi / 180);
        var waypoint = instance_create(cx,cy,o_waypoint);
        waypoint.parent = go_to;
        ds_list_add(tmp_waypoint, waypoint)
    }
    
    closest = distance_to_object(go_to)
    
    // sort, closest to furthest
    for(idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
        change = false
        with (tmp_waypoint[| idw]) {
            //show_debug_message("closest: " + string(other.closest) + " this: " + string(distance_to_object(other)));
            if(distance_to_object(other) < other.closest) {
                other.closest = other.tmp_waypoint[| other.idw]
                other.tmp_waypoint[| other.idw] = other.tmp_waypoint[| 0]
                other.tmp_waypoint[| 0] = other.closest
            }
        }
    }
    for(idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
        go_to = tmp_waypoint[| idw]
        if (instance_exists(go_to)) {
            if (mp_grid_path(global.path.grid, mover.path, x, y, go_to.x, go_to.y, true)) {
                go_to.parent = argument0
                return go_to
            }
            else with (tmp_waypoint[| idw]) instance_destroy() // release
        }
    }
    tmp_waypoint = ds_list_destroy(tmp_waypoint)
    go_to = argument0
    attempt++;
    if (attempt > force_break) return noone
} until (mp_grid_path(global.path.grid, mover.path, x, y, go_to.x, go_to.y, true))
return go_to
