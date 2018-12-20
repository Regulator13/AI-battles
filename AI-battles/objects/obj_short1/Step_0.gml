/// @description Set state

// Inherit the parent event
event_inherited();
//Default state
state = ST_ATTACK

//Guard if a nearby ranged unit has less than 40 health
Inst_guard = collision_circle(x + sprite_width/2, y + sprite_height/2, 64, obj_long1, false, true)
if instance_exists(Inst_guard){
	if Inst_guard.hp < .4 * hp_max{
		Inst_enemy = collision_circle(Inst_guard.x + sprite_width/2, Inst_guard.y + sprite_height/2, Inst_guard.bullet_range * par_unit.bullet_speed, par_player2, false, true)
		if instance_exists(Inst_enemy){
			state = ST_GUARD
			show_debug_message("Guard")
		}
	}
}
