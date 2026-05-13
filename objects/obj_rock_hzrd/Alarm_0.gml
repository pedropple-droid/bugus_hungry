//Self-destroy
	if !global.game_over
	{
		global.last_val = global.player_score
		global.player_score += 5 * global.score_multiplier;
	}; 
	
	instance_destroy()