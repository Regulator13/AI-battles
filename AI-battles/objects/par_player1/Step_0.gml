/// @description move and shoot

// Inherit the parent event
event_inherited();

if distance_to_object(obj_castle2) > 64{
	move_towards_point(obj_castle2.x + sprite_width/2, obj_castle2.y, move_speed)
}

if can_shoot{
	var Inst = collision_circle(x + sprite_width/2, y + sprite_height/2, bullet_speed * bullet_range, par_player2, false, true){
		if instance_exists(Inst){
			with instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Instances", obj_bullet){
				team = 1
				alarm[0] = other.bullet_range
				speed = other.bullet_speed
				direction = point_direction(other.x + other.sprite_width/2, other.y + other.sprite_height/2, Inst.x, Inst.y)
			}
		}
	}
}
else if alarm[0] >= 0{
	alarm[0] = bullet_reload
}
