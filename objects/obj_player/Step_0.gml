/// @description Insert description here
// You can write your code in this editor
if(is_pause) {
	// don't move.
	return;
}

if(keyboard_check_pressed(vk_space)) {
	var cmd_list = [
		[eCmd.CharOn, spr_ch001],
		"春はあけぼの。",
		[eCmd.CharOn, spr_ch002],
		"やうやう白くなりゆく山際、少し明かりて、#紫だちたる雲の細くたなびきたる。",
		[eCmd.CharOff],
		"end.",
	];
	
	event_start(cmd_list);
}


var dx = keyboard_check(vk_left) ? -1 : (keyboard_check(vk_right) ? 1 : 0);
var dy = keyboard_check(vk_up)   ? -1 : (keyboard_check(vk_down)  ? 1 : 0);

var spd = 8;
if(dx == 0 and dy == 0) {
	spd = 0;
}
var dir = point_direction(0, 0, dx, dy);

var vx = lengthdir_x(spd, dir);
var vy = lengthdir_y(spd, dir);

x += vx;
y += vy;
