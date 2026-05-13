//Depth check
	depth = obj_bugu.currLane - 1; 
	
//Variables
	geyser = obj_geyser

//Destroy after has finished
	if (image_index >= image_number - 1)
	{
	    instance_destroy();
		instance_create_layer(x, y, "Instances", geyser)
	}