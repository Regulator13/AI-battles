/// @description Declare winner

if not winner_declared{
	if not instance_exists(obj_castle1){
		show_message("Player 2 wins!")
		winner_declared = true
	}
	
	if not instance_exists(obj_castle2){
		show_message("Player 1 wins!")
		winner_declared = true
	}
}
	