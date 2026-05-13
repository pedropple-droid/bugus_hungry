//Random seed
	randomise()
	
//Determine Direction
	var move_dir = (x > obj_bugu.x) ? -1 : 1;

//Set a Target far outside the room bounds so it never "reaches" the point
	var travel_distance = room_width + 1000; 
	target_x = x + (move_dir * travel_distance);
	target_y = y;

//Set Speed once
	var hzrdSpd = 20;
	move_towards_point(target_x, target_y, hzrdSpd);

//Flip Sprite
	image_xscale = -move_dir;