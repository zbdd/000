store = argument0
closest = noone

switch (store) {
    // FAP
    default:
        for(idx = 0; idx < instance_number(o_fap); idx++) {
            store = instance_find(o_fap, idx);
            if (store.sprite_index == spr_fap) { // find an first aid point
                if (closest == noone) {
                    closest = store
                    continue;
                } else if (distance_to_object(store) < distance_to_object(closest)) {
                    closest = store
                }
            }
        }
    break;
}

return closest;
