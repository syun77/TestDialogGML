/// @description Select Text.
var sel_max = array_length(sel_list);

if(keyboard_check_pressed(vk_up)) {
	sel_idx--;
	if(sel_idx < 0) {
		sel_idx = sel_max - 1;
	}
}
if(keyboard_check_pressed(vk_down)) {
	sel_idx++;
	if(sel_idx >= sel_max) {
		sel_idx = 0;
	}
}

if(keyboard_check_pressed(vk_space)) {
	var sel = sel_list[sel_idx];
	jump_label = sel[1];
	_state = eEventState.ParseCommand;
}
