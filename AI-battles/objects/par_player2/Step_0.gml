/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
#region Inherited
///Check terrain
var lay_id = layer_get_id("Tiles_terrain");
var map_id = layer_tilemap_get_id(lay_id);
var mx = tilemap_get_cell_x_at_pixel(map_id, x, y);
var my = tilemap_get_cell_y_at_pixel(map_id, x, y);
var data = tilemap_get(map_id, mx, my);
var ind = tile_get_index(data);
//Grass
if ind == 3{
	move_speed = move_speed_max - 1
	hit_prob = hit_prob_max - 1 //(reduce chance of being hit to 3/4
}

//Road
else if ind == 1{
	move_speed = move_speed_max + 1
}

//High Ground
else if ind == 2{
	bullet_range = bullet_range_max * 1.5
}

else{
	move_speed = move_speed_max
	hit_prob = hit_prob_max
	bullet_range = bullet_range_max
}
	
	
//Units hit by bullet
with instance_place(x, y, obj_bullet){
	//check team
	if (team != other.team){
		//if the player
		if irandom(other.hit_prob_max) <= other.hit_prob{
			other.hp -= dmg
			with (other) {
				scr_state_switch2(STATE_SCATTER, scatter_time)
				hit_direction = other.direction
				hit_damage = other.dmg
				scatter_direction = hit_direction + 90
			}
		}
		instance_destroy()
	}
}

//collide with solids
if !place_free(x + hspeed, y + vspeed){
	x -= hspeed
	y -= vspeed
}

if hp <= 0{
	instance_destroy()
}

#endregion

//calculate bullet range
range = bullet_range * bullet_speed - 4

switch(state) {
	case STATE_ATTACK:
		if (instance_exists(target)) {
			var dis = distance_to_object(target)
			
			//move towards enemy
			if (dis > range) {
				move_towards_point(target.x, target.y, move_speed)
			}
			else {
				//stop
				speed = 0
				
				//scatter if overlapping
				if place_meeting(x, y, par_player2)
					scr_state_switch2(STATE_SCATTER, scatter_time)
					
				if collision_line(x, y, target.x, target.y, obj_castle2, false, true)
					scr_state_switch2(STATE_SCATTER, scatter_time)
				
				//shoot
				scr_shoot2(true)
			}
		}
		else {
			//find nearest enemy
			target = instance_nearest(x, y, par_player1)
			if !instance_exists(target)
				target = instance_nearest(x, y, obj_castle1)
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
		}
		break
	case STATE_SCATTER:
		if state_first {
			if scatter_direction != -1 {
				direction = scatter_direction
				scatter_direction = -1
			}
			else
				direction = irandom(360)
			
			speed = move_speed
			state_first = false
		}
		break
}

var castle = obj_castle2;
if (instance_exists(castle)) {
	if castle.hp < castle.hp_max {
		//retreat
	}
}