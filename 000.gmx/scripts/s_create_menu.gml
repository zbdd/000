posx = argument0
posy = argument1
text = argument2
var menu = instance_create(posx, posy, o_context_menu);
menu.text = text
menu.debug = true
strings = ds_list_create()

i = 0;
last_string = ''
do {
    string_extracted = s_string_extract(text, ',', i)
    if (string_extracted == last_string) break;
    ds_list_add(strings, string_extracted)
    i++;
    last_string = string_extracted
} until (i > string_length(text))
        
for (j = 0; j < ds_list_size(strings); j++) {
    text = strings[| j]

    var button = instance_create(posx, posy, o_button);
    button.text = text;
    ds_list_add(menu.buttons, button);
    posx += 10
}

return menu