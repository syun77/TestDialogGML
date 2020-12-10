// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function event_start(cmd_list) {
	var evt = instance_create_depth(0, 0, 0, obj_event);
	evt.cmd_list = cmd_list;
}