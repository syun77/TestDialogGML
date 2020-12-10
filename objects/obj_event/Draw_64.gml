/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_jp);

var px = 64;
var py = 600;
draw_set_color(c_blue);
draw_set_alpha(0.2);
draw_roundrect(16, py-32, room_width-16, py+104, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_roundrect(16, py-32, room_width-16, py+104, true);

draw_text(px, py, _text);
