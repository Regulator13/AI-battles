/// @description Initiate long bot variables

// Inherit the parent event
event_inherited();

//shared variables
move_speed_max = 3
move_speed = move_speed_max
team = 2
bullet_range_max = 20 //number of steps a bullet can travel
bullet_range = bullet_range_max
bullet_dmg = 5
bullet_reload = 20

//state
state = STATE_ADVANCE

//target
target_x = room_width/4
target_y = room_height/2