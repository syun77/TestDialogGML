/// @description Insert description here
// You can write your code in this editor
if(is_pause) {
	// don't move.
	return;
}

timer++;

if(keyboard_check_pressed(vk_space)) {
	var cmd_list = [
		[eCmd.Select, "GameMaker Studio2", "gms2", "RPGツクール", "rpgmaker", "ウディタ", "wolfeditor"],
		
		[eCmd.Label, "gms2"],
		"GameMaker Studio2を選びました",
		[eCmd.Goto, "end"],
		
		[eCmd.Label, "rpgmaker"],
		"RPGツクールを選びました",
		[eCmd.Goto, "end"],
		
		[eCmd.Label, "wolfeditor"],
		"ウディタを選びました",
		[eCmd.Goto, "end"],		
		
		[eCmd.Label, "end"],
		"end."
		
		//[eCmd.Goto, "hoge"],
		//[eCmd.CharOn, spr_ch001],
		//"春はあけぼの。",
		//[eCmd.CharOn, spr_ch002],
		//[eCmd.Label, "hoge"],
		//"やうやう白くなりゆく山際、少し明かりて、#紫だちたる雲の細くたなびきたる。",
		//[eCmd.CharOff],
		//"end.",
	];
	
	event_start(cmd_list);
}


var dx = keyboard_check(vk_right) - keyboard_check(vk_left);
var dy = keyboard_check(vk_down)  - keyboard_check(vk_up);

var spd = 4;
is_run = true;
if(dx == 0 and dy == 0) {
	spd = 0;
	is_run = false;
}
if(dx < 0) {
	_dir = eDir.Left;
}
if(dx > 0) {
	_dir = eDir.Right;
}
if(dy < 0) {
	_dir = eDir.Up;
}
if(dy > 0) {
	_dir = eDir.Down;
}

var dir = point_direction(0, 0, dx, dy);

var vx = lengthdir_x(spd, dir);
var vy = lengthdir_y(spd, dir);

var tilemap = layer_tilemap_get_id("Tiles_Hit");
var xedge = dx > 0 ? bbox_right : bbox_left;
if(tilemap_get_at_pixel(tilemap, xedge+vx, bbox_top) != 0 || tilemap_get_at_pixel(tilemap, xedge+vx, bbox_bottom) != 0) {
	if(vx > 0) {
		x = x - (x mod spd);
	}
	else if(vx < 0) {
		x = x + (x mod spd);
	}
	vx = 0;
}
var yedge = dy > 0 ? bbox_bottom : bbox_top;
if(tilemap_get_at_pixel(tilemap, bbox_left, yedge+vy) != 0 || tilemap_get_at_pixel(tilemap, bbox_right, yedge+vy) != 0) {
	if(vy > 0) {
		y = y - (y mod spd);
	}
	else if(vy < 0) {
		y = y + (y mod spd);
	}
	vy = 0;
}

x += vx;
y += vy;
