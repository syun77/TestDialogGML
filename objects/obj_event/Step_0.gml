/// @description Insert description here
// You can write your code in this editor

switch(_state) {
case eEventState.Init:
	// all objects pause.
	with(all) {
		if(variable_instance_exists(self, "is_pause")) {
			self.is_pause = true;
		}
	}
	_state = eEventState.ParseCommand;
	break;
	
case eEventState.ParseCommand:
	cmd_idx++;
	if(cmd_idx >= array_length(cmd_list)) {
		// end.
		instance_destroy();
		return;
	}
	
	var cmd = cmd_list[cmd_idx];
	if(is_string(cmd)) {
		_text = string_replace_all(cmd, "#", "\n");
		_state = eEventState.TextWait;
		break;
	}
	if(is_array(cmd) == false) {
		break; // can't parse.
	}
	var cmd_id = cmd[0];
	switch(cmd_id) {
	case eCmd.CharOn:
		_ch = cmd[1];
		break;
	case eCmd.CharOff:
		_ch = noone;
		break;
	}
	break;
	
case eEventState.TextWait:
	if(keyboard_check_pressed(vk_space)) {
		// next.
		_state = eEventState.ParseCommand;
	}
	break;
}
