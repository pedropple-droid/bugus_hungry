//Check depth
	if (obj_bugu.lane_index <= 0) depth = obj_bugu.depth - 1
	if (obj_bugu.lane_index > 0) depth = obj_bugu.depth + 1

//Destroy after has finished
if (image_index >= image_number - 1)
{
	if (!global.game_over)
	{
		global.last_val = global.player_score;
		global.player_score += 10 * global.score_multiplier;
	};
	
    instance_destroy();
}