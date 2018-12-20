/// @function set_shoot2
/// @description create bullet
/// @return none

//attack
if (alarm[0] < 0) {
	//shoot bullet
	with(instance_create_layer(x, y, "Instances", obj_bullet)) {
		// set team
		team = 2
			
		//set values
		direction = point_direction(x, y, other.target.x, other.target.y)
		speed = other.bullet_speed
			
		//set range
		alarm[0] = other.bullet_range
	}
				
//reload
alarm[0] = bullet_reload
}