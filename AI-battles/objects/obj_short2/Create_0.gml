/// @description Insert description here

// Inherit the parent event
event_inherited();

//shared variables
move_speed_max = 3
move_speed = move_speed_max
team = 2
bullet_range_max = 8 //number of steps a bullet can travel
bullet_range = bullet_range_max
bullet_dmg = 10
bullet_reload = 30

//state
state = STATE_ATTACK
target = obj_long2

//target
target_x = 32
target_y = room_height/2