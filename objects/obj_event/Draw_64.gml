/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_jp);

var px = 64;
var py = 600;
var dy = string_height("a");
draw_set_color(c_blue);
draw_set_alpha(0.2);
draw_roundrect(16, py-32, room_width-16, py+104, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_roundrect(16, py-32, room_width-16, py+104, true);

switch(_state) {
case eEventState.TextWait:
	draw_text(px, py, _text);
	break;
case eEventState.SelectText:
	for(var i = 0; i < array_length(sel_list); i++) {
		if(i == sel_idx) {
			// draw cursor.
			draw_set_color(c_blue);
			draw_rectangle(px, py, px+512, py+dy, false);
			draw_set_color(c_white);
		}
		var sel = sel_list[i];
		draw_text(px, py, sel[0]);
		py += dy;
	}
	break;
}
