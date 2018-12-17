/// @description Pwn player 1

// Inherit the parent event
event_inherited();

//calculate bullet range
range = bullet_range * bullet_speed

//find nearest enemy
var enemy_nearest = instance_nearest(x, y, par_player1)

//move towards enemy
if (distance_to_object(obj_castle1) < range) {
	move_towards_point(enemy_nearest.x, enemy_nearest.y, move_speed)
}
else {
	//stop
	speed = 0;
	
	//attack
	if (alarm[0] < 0) {
		//shoot bullet
		with(instance_create_layer(x, y, "Instances", obj_bullet)) {
			// set team
			team = 2
			
			//set values
			direction = point_direction(x, y, enemy_nearest.x, enemy_nearest.y)
			speed = bullet_speed
			
			//set range
			alarm[0] = other.bullet_range
		}
	}
}