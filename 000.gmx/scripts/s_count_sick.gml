count = 0
for (idx = 0; idx < instance_number(o_casualty); idx++) {
    casualty = instance_find(o_casualty, idx);
    if (casualty.effect == 'sick') count++
}
return count;