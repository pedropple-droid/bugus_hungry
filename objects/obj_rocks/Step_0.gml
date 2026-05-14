//Tutorial
	if (global.rock)
	{
		//Variables
		var _tut_spawn_x = obj_bugu.x + 150
		var _tut_spawn_y = obj_bugu.y
		
		//Tutorial shadow sequence
		if (!layer_sequence_exists("Instances", active_shadow_id))
		{
			show_debug_message("got at shadow spawn")
			active_shadow_id = layer_sequence_create("Instances", _tut_spawn_x, _tut_spawn_y, shadow_seq)
		};
		
		if (layer_sequence_exists("Instances", active_shadow_id))
		{
			if (layer_sequence_is_finished(active_shadow_id))
			{
				layer_sequence_destroy(active_shadow_id);
				active_falling_id = layer_sequence_create("Instances", _tut_spawn_x, _tut_spawn_y, falling_rock);
			};
		};
		
		//Tutorial falling sequence
		if (layer_sequence_exists("Instances", active_falling_id))
		{
			var _pos = layer_sequence_get_headpos(active_falling_id)
			if _pos == 7
			{
				sound_handler(snd_rockhitground);
				cam_shake = 6;
				active_rock_id = instance_create_layer(_tut_spawn_x, _tut_spawn_y, "Instances", hzrd_obj);
			};
		
			if (layer_sequence_is_finished(active_falling_id))
			{
				if (layer_sequence_exists("Instances", active_falling_id)) 
				{
					layer_sequence_destroy(active_falling_id);
				};
				
				var curr_obst = choose(obj_rock_obst, obj_explodingrock)
				instance_create_layer(_tut_spawn_x, _tut_spawn_y, "Instances", curr_obst);
				obj_textholder.at_crossroads = false
				obj_textholder.t = 0
				show_debug_message("got at rock spawn")
			};
			global.rock = false
			instance_destroy(obj_rocks)
		};
		
		//Tutorial shake effect
		if (cam_shake > 0.1) cam_shake -= cam_shake / 5;
		else cam_shake = 0;
		camera_set_view_angle(view_camera[0], -cam_shake + random(cam_shake * 2))
	};

	if (!global.canstart) exit

//Rock spawner handler
	timer -= 1
  
	if (timer <= 0) 
	{
		timer = rate

		fall_random_x = random_range(0.9, 1.1);
		
		lane_variation = choose(-1, 0, 1);
		lane_target = clamp(obj_bugu.lane_index + lane_variation, 0, array_length(obj_gamemanager.lanes) - 1);
		
		future_x = obj_bugu.x + (obj_bugu.hspd * predict_time);
		future_y = obj_gamemanager.lanes[lane_target];
		min_x = min(obj_bugu.x, future_x) - 64;
		max_x = max(obj_bugu.x, future_x) - 64;
		spawn_x = irandom_range(min_x, max_x) * fall_random_x
		spawn_y = future_y;

		sound_handler(snd_rockfalling, ,true, true)
		
		active_shadow_id = layer_sequence_create("Instances", spawn_x, spawn_y, shadow_seq)
	};
	
	
	if (layer_sequence_exists("Instances", active_shadow_id))
	{
		if (layer_sequence_is_finished(active_shadow_id))
		{
			layer_sequence_destroy(active_shadow_id);
			active_falling_id = layer_sequence_create("Instances", spawn_x, spawn_y, falling_rock);
		};
	};
	
	if (layer_sequence_exists("Instances", active_falling_id))
	{
		var _pos = layer_sequence_get_headpos(active_falling_id)
		if _pos == 7
		{
			sound_handler(snd_rockhitground);
			cam_shake = 6;
			active_rock_id = instance_create_layer(spawn_x, spawn_y, "Instances", hzrd_obj);
		};
		
		if (layer_sequence_is_finished(active_falling_id))
		{
			if (layer_sequence_exists("Instances", active_falling_id)) 
			{
				layer_sequence_destroy(active_falling_id);
			};
				
			var curr_obst = choose(obj_rock_obst, obj_explodingrock)
			instance_create_layer(spawn_x, spawn_y, "Instances", curr_obst);
		};
	};


//Effects Handler
	if (cam_shake > 0.1) cam_shake -= cam_shake / 5;
	else cam_shake = 0;
	
	camera_set_view_angle(view_camera[0], -cam_shake + random(cam_shake * 2))