/// @description move and shoot

// Inherit the parent event
event_inherited();

if state == ST_ATTACK{
	if instance_exists(obj_castle2){
		if distance_to_object(obj_castle2) > 64{
			move_towards_point(obj_castle2.x + obj_castle2.sprite_width/2, obj_castle2.y, move_speed)
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

if hp < 25 and instance_exists(collision_circle(x + sprite_width/2, y + sprite_height/2, 32, obj_bullet, false, true)){
	state = ST_DODGE
}

if state == ST_DODGE{
	var Dodge = collision_circle(x + sprite_width/2, y + sprite_height/2, 32, obj_bullet, false, true)
	if instance_exists(Dodge) and Dodge.team != team{
		direction = Inst.direction + 90
		speed = move_speed
	}
	else state = ST_ATTACK
}

if can_shoot{
	Inst = collision_circle(x + sprite_width/2, y + sprite_height/2, bullet_speed * bullet_range, par_player2, false, true){
		if instance_exists(Inst){
			with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
				team = 1
				alarm[0] = other.bullet_range
				speed = other.bullet_speed
				direction = point_direction(other.x + other.sprite_width/2 + (other.Inst.hspeed * other.Inst.move_speed / speed) , other.y + other.sprite_height/2 + (other.Inst.vspeed*other.Inst.move_speed/speed), other.Inst.x, other.Inst.y)
				other.can_shoot = false
			}
		}
		else if distance_to_object(obj_castle2) <= par_unit.bullet_speed*bullet_range{
			if instance_exists(obj_castle2){
				with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
					team = 1
					alarm[0] = other.bullet_range
					speed = other.bullet_speed
					direction = point_direction(other.x + other.sprite_width/2, other.y + other.sprite_height/2, obj_castle2.x + obj_castle2.sprite_width/2,obj_castle2.y + obj_castle2.sprite_height/2)
					other.can_shoot = false
				}
			}
		}
	}
}
else if alarm[0] <= 0{
	alarm[0] = bullet_reload
}
