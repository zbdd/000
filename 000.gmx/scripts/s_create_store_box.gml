store = argument0
box = instance_create(store.x, store.y - 10, o_store_box);
box.name = store.name;
box.description = store.description;

// TODO fix this
box.mugshot = store.sprite_index;
box.mugshot_extra = 1

return box;
