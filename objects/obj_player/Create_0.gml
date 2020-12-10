/// @description Insert description here
// You can write your code in this editor

enum eDir {
	None = -1,
	Left = 0,
	Up,
	Right,
	Down,
};


is_pause = false;
is_run = false;
timer = 0;
_dir = eDir.Down;


get_subimg = function() {
	if(is_run) {
		var run_tbl = [
			[2, 3],
			[6, 7],
			[10, 11],
			[14, 15]
		];
		var tbl = run_tbl[_dir];
		var idx = int64(timer%16 < 8);
		return tbl[idx];
	}
	else {
		var standby_tbl = [
			[0, 1],
			[4, 5],
			[8, 9],
			[12, 13]
		];
		var tbl = standby_tbl[_dir];
		var idx = int64(timer%32 < 16);
		return tbl[idx];
	}
};
