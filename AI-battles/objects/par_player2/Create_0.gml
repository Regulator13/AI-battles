/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//team
team = 2

target = noone;

state = STATE_IDLE
goal_state = STATE_ATTACK
state_first = true //whether first frame in state

scatter_time = 1
scatter_direction = -1 //direction to scatter (-1 for none given)

//hit by a bullet info
hit_direction = 0
hit_damage = 0

//define macros
#macro STATE_IDLE 1
#macro STATE_ADVANCE 2
#macro STATE_RETREAT 3
#macro STATE_ATTACK 4
#macro STATE_GAURD 5
#macro STATE_SCATTER 6