/// @function set_state_swtich2(new_state, time)
/// @description handles everything necesarry in changing a state
/// @param new_state real | state to change it to
/// @param time boolean | time to stay in new state (0 for infinite)
/// @returns n/a

var new_state = argument0
var time = argument1

if (time) {
	state = new_state
	alarm[1] = time * 30
}
else
	goal_state = new_state

//reset state first
state_first = true;
	