/// @description Insert description here
// You can write your code in this editor

// all objects un-pause.
with(all) {
	if(variable_instance_exists(self, "is_pause")) {
		self.is_pause = false;
	}
}
