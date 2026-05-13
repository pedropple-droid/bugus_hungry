//Check depth
	depth = (obj_bugu.lane_index <= 0) ? -2 : 1;

// Destroy if way off-screen to save memory
	if (x < -500 || x > room_width + 500) instance_destroy();