//var casualty = argument0

danger = instance_create(x, y, o_danger);

if (string_length(argument0) > 1) {
    danger.state = 'active'
    danger.text = argument0
    danger.type = argument1
} else {
    danger.state = 'inactive'
    danger.text = 'there is no danger'
    danger.type = ''
}

return danger