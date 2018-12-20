/// @description Interactions

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
	if team != other.team{
		//if the player
		if irandom(other.hit_prob_max) <= other.hit_prob{
			other.hp -= dmg
		}
		instance_destroy()
	}
}

if hp <= 0{
	instance_destroy()
}
