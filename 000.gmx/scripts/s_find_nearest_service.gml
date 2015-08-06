service = argument0
closest = noone

switch (service) {
    // AMBO
    default:
        for(idx = 0; idx < instance_number(o_service); idx++) {
            service = instance_find(o_service, idx);
            if (service.sprite_index == spr_player) { // find an ambulance officer
                if (closest == noone) {
                    closest = service
                    continue;
                } else if (distance_to_object(service) < distance_to_object(closest)) {
                    closest = service
                }
            }
        }
    break;
}

return closest;
