tmp_waypoint = ds_list_create()
go_to = argument0
if (!mp_grid_path(global.path.grid, path, x, y, go_to.x, go_to.y, true)) {
    for(ida = 0; ida < 361; ida+=45) {
        cx = go_to.x + 32 * cos(ida * pi / 180);
        cy = go_to.y + 32 * sin(ida * pi / 180);
        var waypoint = instance_create(cx,cy,o_waypoint);
        waypoint.parent = go_to;
        ds_list_add(tmp_waypoint, waypoint)
    }
}
closest = distance_to_object(go_to)
for(idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
    change = false
    with (tmp_waypoint[| idw]) {
        //show_debug_message("closest: " + string(other.closest) + " this: " + string(distance_to_object(other)));
        if(distance_to_object(other) < other.closest) other.change = true
    }
    if (change) go_to = tmp_waypoint[| idw]
}
return go_to
