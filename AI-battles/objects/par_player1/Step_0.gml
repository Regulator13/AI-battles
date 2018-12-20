/// @description move and shoot

// Inherit the parent event
event_inherited();

if state == ST_ATTACK{
	if distance_to_object(obj_castle2) > 64{
		move_towards_point(obj_castle2.x + obj_castle2.sprite_width/2, obj_castle2.y, move_speed)
	}
}

if state == ST_DEFEND{
	if distance_to_object(obj_castle1) > 48{
		move_towards_point(obj_castle1.x + obj_castle1.sprite_width/2, obj_castle1.y + obj_castle1.sprite_height, move_speed)
	}
}

if hp < 25 and instance_exists(collision_circle(x + sprite_width/2, y + sprite_height/2, 32, obj_bullet, false, true)){
	state = ST_DODGE
}

if state == ST_DODGE{
	var Inst = collision_circle(x + sprite_width/2, y + sprite_height/2, 32, obj_bullet, false, true)
	if instance_exists(Inst) and Inst.team != team{
		direction = Inst.direction + 90
		speed = move_speed
	}
	else state = ST_ATTACK
}

if can_shoot{
	var Inst = collision_circle(x + sprite_width/2, y + sprite_height/2, bullet_speed * bullet_range, par_player2, false, true){
		if instance_exists(Inst){
			with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
				team = 1
				alarm[0] = other.bullet_range
				speed = other.bullet_speed
				direction = point_direction(other.x + other.sprite_width/2 + (Inst.hspeed*Inst.move_speed/speed) , other.y + other.sprite_height/2 + (Inst.vspeed*Inst.move_speed/speed), Inst.x, Inst.y)
				other.can_shoot = false
			}
		}
		else if distance_to_object(obj_castle2) <= par_unit.bullet_speed*bullet_range{
			with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
				team = 1
				alarm[0] = other.bullet_range
				speed = other.bullet_speed
				direction = point_direction(other.x + other.sprite_width/2, other.y + other.sprite_height/2, obj_castle2.x + obj_castle2.sprite_width/2, Inst.y + obj_castle2.sprite_height/2)
				other.can_shoot = false
			}
		}
	}
}
else if alarm[0] <= 0{
	alarm[0] = bullet_reload
}
