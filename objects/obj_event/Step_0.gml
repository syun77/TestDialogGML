/// @description Insert description here
// You can write your code in this editor

switch(_state) {
case eEventState.Init:
	event_user(eEventUser.Init);
	break;
	
case eEventState.ParseCommand:
	event_user(eEventUser.ParseCommand);
	break;
	
case eEventState.TextWait:
	event_user(eEventUser.TextWait);
	break;
	
case eEventState.SelectText:
	event_user(eEventUser.SelectText);
	break;
}
