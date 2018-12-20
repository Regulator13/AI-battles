/// @description move and shoot

// Inherit the parent event
event_inherited();

Target = noone

if state == ST_ATTACK{
	Inst = collision_circle(x + sprite_width/2, y + sprite_height/2, MAX_RANGE, par_player2, false, true)
	if instance_exists(Inst){
		if state2 == ST_EVADE{
			if distance_to_object(Inst) < bullet_range * bullet_speed{
				move_towards_point(Inst.x, Inst.y, -move_speed)
			}
		}
		else if distance_to_object(Inst) > bullet_range * bullet_speed - SHOOT_TOL{
			move_towards_point(Inst.x, Inst.y, move_speed)
		}
		else{
			speed = move_speed
			direction = 90
		}
	}
	else if instance_exists(obj_castle2){
		if distance_to_object(obj_castle2) > 48{
			move_towards_point(obj_castle2.x + obj_castle2.sprite_width/2, obj_castle2.y, move_speed)
		}
		else{
			speed = move_speed
			direction = 90
		}
	}
}

if state == ST_GUARD{
	if instance_exists(Inst_enemy){
		if distance_to_object(Inst_enemy) > (bullet_speed * bullet_range - SHOOT_TOL){
			move_towards_point(Inst_enemy.x + Inst_enemy.sprite_width/2, Inst_enemy.y, move_speed)
			Target = Inst_enemy
		}
	}
}

if state == ST_DEFEND{
	if instance_exists(obj_castle1){
		if distance_to_object(obj_castle1) > 48{
			move_towards_point(obj_castle1.x + obj_castle1.sprite_width/2, obj_castle1.y + obj_castle1.sprite_height, move_speed)
		}
	}
}

if hp < DODGE_HEALTH and instance_exists(collision_circle(x + sprite_width/2, y + sprite_height/2, 32, obj_bullet, false, true)){
	var Dodge = collision_circle(x + sprite_width/2, y + sprite_height/2, 32, obj_bullet, false, true)
	if instance_exists(Dodge) and Dodge.team != team{
		direction = Dodge.direction + 90
		speed = move_speed
	}
}

if can_shoot{
	if Target == noone{
		Inst = collision_circle(x + sprite_width/2, y + sprite_height/2, bullet_speed * bullet_range, par_player2, false, true)
		if instance_exists(Inst){
			with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
				team = 1
				alarm[0] = other.bullet_range
				speed = other.bullet_speed
				dmg = other.bullet_dmg
				direction = point_direction(other.x + other.sprite_width/2, other.y + other.sprite_height/2, other.Inst.x + (other.Inst.hspeed * other.Inst.move_speed / speed), other.Inst.y + (other.Inst.vspeed*other.Inst.move_speed/speed))
				other.can_shoot = false
			}
		}
		else if distance_to_object(obj_castle2) <= par_unit.bullet_speed*bullet_range{
			if instance_exists(obj_castle2){
				with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
					team = 1
					alarm[0] = other.bullet_range
					speed = other.bullet_speed
					dmg = other.bullet_dmg
					direction = point_direction(other.x + other.sprite_width/2, other.y + other.sprite_height/2, obj_castle2.x + obj_castle2.sprite_width/2,obj_castle2.y + obj_castle2.sprite_height/2)
					other.can_shoot = false
				}
			}
		}
	}
	else{
		with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
			team = 1
			alarm[0] = other.bullet_range
			speed = other.bullet_speed
			direction = point_direction(other.x + other.sprite_width/2, other.y + other.sprite_height/2, other.Target.x + (other.Target.hspeed * other.Target.move_speed / speed), other.Target.y + (other.Target.vspeed*other.Target.move_speed/speed))
			other.can_shoot = false
		}
	}
}

else if alarm[0] <= 0{
	alarm[0] = bullet_reload
}
