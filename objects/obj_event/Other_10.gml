/// @description Init
// all objects pause.
with(all) {
	if(variable_instance_exists(self, "is_pause")) {
		self.is_pause = true;
	}
}
_state = eEventState.ParseCommand;
