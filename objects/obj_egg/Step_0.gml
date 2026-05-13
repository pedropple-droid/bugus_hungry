//Check
	if (keyboard_check_pressed(global.drop_egg))
	{
		mask_index = egg_nohit;
		isThrown = true
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
