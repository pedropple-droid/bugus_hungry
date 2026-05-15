//Variables
	var _cam = view_camera[0];
	var _cam_x  = camera_get_view_x(_cam);
	var _cam_w  = camera_get_view_width(_cam);

//Check depth
	if (obj_bugu.lane_index <= 0) depth = obj_bugu.depth - 1
	if (obj_bugu.lane_index > 0) depth = obj_bugu.depth + 1

//Destroy if way off-screen to save memory
	if (x < _cam_x - 200 || x > _cam_x + _cam_w + 200)
	{
		if (global.game_over) exit
		global.last_val = global.player_score;
		global.player_score += 10 * global.score_multiplier;
		instance_destroy();
		if (global.learning)
		{
			global.arrow = true
		};
	};
