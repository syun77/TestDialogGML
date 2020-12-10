/// @description Insert description here
// You can write your code in this editor

enum eEventState {
	Init,
	ParseCommand,
	TextWait,
	SelectText,
};

enum eEventUser {
	Init = 0,
	ParseCommand = 1,
	TextWait = 2,
	SelectText = 3,
};

enum eCmd {
	Message,
	CharOn,
	CharOff,
	Label,
	Goto,
	Select,
};

_state = eEventState.Init;
cmd_list = [];
cmd_idx = -1;
jump_label = noone;
sel_list = [];
sel_idx = 0;


_text = "";
_ch = noone;
