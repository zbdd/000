casualty = argument0
closest_service = s_find_nearest_service("ambo");
closest_store = s_find_nearest_store("fap")

if (distance_to_object(closest_service) < distance_to_object(closest_store)) return closest_service
else return closest_store