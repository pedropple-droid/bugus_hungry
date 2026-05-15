//Check for sprite direction
	if (x > room_width / 2) image_xscale = - 1
	else image_xscale = 1;

//State machine
	state = "CHASING";
	
//MS Variable
	move_speed = 1;
	retreat_speed = 20;