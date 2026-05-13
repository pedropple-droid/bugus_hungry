//MAJOR CHECK
	if (!instance_exists(obj_bugu)) exit
	
//Randomise set seed
	randomise()

//Main variables
	lanes = [500, 564, 628];
	spawn_timer = 0;
	spdMult = 1;

//Start countdown for speed + 
	alarm[0] = 350