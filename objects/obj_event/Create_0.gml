/// @description Insert description here
// You can write your code in this editor

enum eEventState {
	Init,
	ParseCommand,
	TextWait,
};

enum eCmd {
	CharOn,
	CharOff,
};

_state = eEventState.Init;
cmd_list = [];
cmd_idx = -1;

_text = "";
_ch = noone;
