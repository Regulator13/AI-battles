/// @description Pwn player 1

// Inherit the parent event
event_inherited();

//calculate bullet range
range = bullet_range * bullet_speed - range_buffer

switch(state) {
	case STATE_ATTACK:
		//find nearest enemy
		target = instance_nearest(x, y, obj_castle1)

		if (instance_exists(target)) {
			//move towards enemy
			var dis = distance_to_object(target)
			if (dis > range) {
				move_towards_point(target.x, target.y, move_speed)
			}
			else {
				//stop
				speed = 0
	
				scr_shoot2()
			}
		}
		break
	case STATE_ADVANCE:
		move_towards_point(target_x, target_y, move_speed)
		if distance_to_point(target_x, target_y) < 32 {
			state = STATE_ATTACK
		}
		break
	case STATE_RETREAT:
		break
}

var castle = obj_castle2;
if castle.hp < castle.hp_max {
	//retreat
}
	
