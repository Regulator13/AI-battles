/// @function set_shoot2(predict)
/// @description create bullet
/// @param predict boolean | whether to preditct the next position
/// @return none

var predict = argument0

//attack
if (alarm[0] < 0) {
	//shoot bullet
	with(instance_create_layer(x, y, "Instances", obj_bullet)) {
		// set team
		team = 2
			
		//set values
		direction = point_direction(x, y, other.target.x, other.target.y)
		
		#region Prediction shooting
		if (predict) {
			var dis = distance_to_object(other.target)
			var t = other.bullet_speed/dis
			var px = other.target.x + (other.target.hspeed * t)/1
			var py = other.target.y + (other.target.vspeed * t)/1
			direction = point_direction(x, y, px, py)
		}
		
		#endregion
		
		speed = other.bullet_speed
		dmg = other.bullet_dmg
		
		//set range
		alarm[0] = other.bullet_range
	}
				
//reload
alarm[0] = bullet_reload
}