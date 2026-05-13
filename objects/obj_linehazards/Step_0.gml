//Warning spawner handler
	spawn_timer -= 1;

	if(spawn_timer <= 0)
	{
		spawn_timer = (400 * obj_gamemanager.hzrdStart) / spdMult;

		//Spawner variables
		var lane_variation = choose(-1, 0, 1);
		var lane_target = clamp(obj_bugu.lane_index + lane_variation, 0, array_length(obj_gamemanager.lanes) - 1);
		
		var cam = view_camera[0]
		var _offset = 100;
		var _vw = camera_get_view_width(cam) / 2 - _offset;
		
		left_warn = obj_bugu.x - _vw 
		right_warn = obj_bugu.x + _vw

		spawn_y = lanes[lane_target];
		spawn_x = choose(left_warn, right_warn)
		
		//Pick spawn position
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_warningsign);
	};	
