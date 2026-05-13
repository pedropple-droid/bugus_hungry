//Check depth
	if (obj_bugu.lane_index <= 0) depth = obj_bugu.depth - 1
	if (obj_bugu.lane_index > 0) depth = obj_bugu.depth + 1
	
//Check inside collisin
	with (obj_bugu)
	{
	    if (place_meeting(x, y, other)) 
		{
	        // Push Bugu away from the rock's center
	        var _dir = sign(x - other.x);
	        if (_dir == 0) _dir = 1; 
	        x += _dir * 32; 
	    };
	};