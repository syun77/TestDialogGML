/// @description Parse Command
var is_exit = false;
while(is_exit = false) {
	cmd_idx++;
	if(cmd_idx >= array_length(cmd_list)) {
		// end.
		instance_destroy();
		exit;
	}
	
	var cmd = cmd_list[cmd_idx];
	if(is_string(cmd)) {
		var c = string_char_at(cmd, 1);
		switch(c) {
		case "*":
			cmd = [eCmd.Label, cmd];
			break;
		case ">":
			var label = string_replace(cmd, ">", "*");
			cmd = [eCmd.Goto, label];
			break;
		default:
			// text.
			cmd = [eCmd.Message, cmd];
			break;
		}
	}
	if(is_array(cmd) == false) {
		continue; // can't parse.
	}
	
	var cmd_id = cmd[0];
	if(jump_label != noone) {
		if(cmd_id != eCmd.Label) {
			continue; // don't exec.
		}
		if(jump_label == cmd[1]) {
			jump_label = noone; // end jump label.
			continue;
		}
	}
	
	// parse command.	
	switch(cmd_id) {
	case eCmd.Message:
		_text = string_replace_all(cmd[1], "#", "\n");
		_state = eEventState.TextWait;
		is_exit = true;
		break;
		
	case eCmd.CharOn:
		_ch = cmd[1];
		break;
		
	case eCmd.CharOff:
		_ch = noone;
		break;
		
	case eCmd.Goto:
		jump_label = cmd[1];
		break;
		
	case eCmd.Select:
		sel_idx = 0;
		sel_list = [];
		for(var i = 1; i < array_length(cmd); i += 2) {
			var idx = int64((i-1)/2);
			sel_list[idx] = [
				cmd[i],   // text
				cmd[i+1], // label
			];
		}
		_state = eEventState.SelectText;
		is_exit = true;
		break;
	}
}
