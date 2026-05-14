
//Useful variables
	lane_index = 0;
	lanes = [480, 544, 608];
	lane_variation = choose(-1, 0, 1);
	lane_target = clamp(lane_index + lane_variation, 0, array_length(lanes) - 1);
	isThrown = false
	
//Arc variables
	t = 0;
		
	start_x = x;
	start_y = y;
	
	future_x = x + (obj_bugu.sprtdir * irandom_range(500, 600));
	future_y = lanes[lane_target];
