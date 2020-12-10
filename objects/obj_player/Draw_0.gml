/// @description Insert description here
// You can write your code in this editor

var subimg = get_subimg();
var prev = gpu_get_tex_mip_filter();
gpu_set_tex_mip_filter(tf_point); // dot by dot.
draw_sprite_ext(spr_player, subimg, x, y, 2, 2, 0, c_white, 1);
gpu_set_tex_mip_filter(prev);
