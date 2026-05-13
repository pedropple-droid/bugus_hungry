//Check
	if (keyboard_check_pressed(global.drop_egg))
	{
		mask_index = egg_nohit;
		isThrown = true
		start_x = x
		start_y = y
		t = 0
		lane_variation = choose(-1, 0, 1);
		lane_target = clamp(lane_index + lane_variation, 0, array_length(obj_gamemanager.lanes) - 1);
		randomDir = choose( x - (irandom_range(50, 300)) , x + (irandom_range(50, 300)))
		future_x = randomDir
		future_y = obj_gamemanager.lanes[lane_target];
		obj_bugu.hasEgg = false
	};
	
	if isThrown
	{
		//Check collision
		mask_index = egg_nohit;

		//Progress
		t += 0.05;
		if (t > 1)
		{
		    t = 1;
		    isThrown = false;
		}
		
		//Movement
		var base_x = lerp(start_x, future_x, t);
		var base_y = lerp(start_y, future_y, t);

		//Arc
		var height = 80;
		var arc = sin(t * pi) * height;
		
		var _sprtW = sprite_width / 2
		x = clamp(base_x, _sprtW, room_width - _sprtW);
		y = base_y - arc;
	}
	else
	{
		mask_index = egg_export;
		if obj_bugu.hasEgg
		{
		    x = obj_bugu.xprevious;
		    y = obj_bugu.yprevious - 50;
		    depth = obj_bugu.depth + 1;
		}
	}
