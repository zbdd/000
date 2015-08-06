tmp_waypoint = ds_list_create()
go_to = argument0
attempt = 0;
radius = 10
while (!mp_grid_path(global.path.grid, path, x, y, go_to.x, go_to.y, true)) {
    for(ida = 0; ida < 361; ida+=min(45, irandom(90))) {
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
        if (mp_grid_path(global.path.grid, path, x, y, go_to.x, go_to.y, true)) {
            go_to.parent = argument0
            return go_to
        }
        else with (tmp_waypoint[| idw]) instance_destroy() // release
    }
    ds_list_clear(tmp_waypoint)
    go_to = argument0
    attempt++;
}
return go_to
