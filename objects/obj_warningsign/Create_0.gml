//Randomise set seed
	randomise()

//Alarm made to destroy object
	alarm[0] = 80

//Depth check
	depth = -5

// Determine side once at birth
	if (obj_linehazards.spawn_x < obj_bugu.x) my_side = "left";
	else my_side = "right";