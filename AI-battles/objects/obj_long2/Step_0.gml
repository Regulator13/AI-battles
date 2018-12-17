/// @description Pwn player 1

// Inherit the parent event
event_inherited();

//calculate bullet range
range = bullet_range * bullet_speed

switch(state) {
	case STATE_ATTACK:
		//find nearest enemy
		enemy_nearest = instance_nearest(x, y, obj_castle1)

		if (instance_exists(enemy_nearest)) {
			//move towards enemy
			var dis = distance_to_object(enemy_nearest)
			if (dis > range) {
				move_towards_point(enemy_nearest.x, enemy_nearest.y, move_speed)
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
	
