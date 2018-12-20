/// @description Pwn player 1

// Inherit the parent event
event_inherited();

//calculate bullet range
range = bullet_range * bullet_speed - 4

switch(state) {
	case STATE_ATTACK:
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
		else {
			//find nearest enemy
			target = instance_nearest(x, y, par_player1)
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
	case STATE_GAURD:
		var dis = distance_to_object(target)
			if (dis > range) {
				move_towards_point(target.x, target.y, move_speed)
			}
			else {
				//stop
				speed = 0
				
				if place_meeting(x, y, par_player2) {
					direction = irandom(360)
					speed = move_speed/2
				}
			}
}

var castle = obj_castle2;
if castle.hp < castle.hp_max {
	//retreat
}
	
