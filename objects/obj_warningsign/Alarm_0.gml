//Determine if we are on the left or right of the player
	var side_offset = 200; // How far off-screen the arrow starts
	var spawn_x = 0;

	if (x > obj_bugu.x) spawn_x = x + side_offset;
	
	else spawn_x = x - side_offset;

//Create the arrow at the calculated position
	instance_create_layer(spawn_x, y, "Instances", obj_arrow);

//Goodbye warning sign
	instance_destroy();