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
			if instance_exists(obj_tutrock)
			{
				instance_destroy(obj_tutrock)
				global.rock = false
			}
		};
	};
		
//Tutorial shake effect
	if (cam_shake > 0.1) cam_shake -= cam_shake / 5;
	else cam_shake = 0;
	camera_set_view_angle(view_camera[0], -cam_shake + random(cam_shake * 2))