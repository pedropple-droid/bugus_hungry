//Randomise set seed
	randomise()

//Main gameplay variables
	//Bugu original color
	base_color = image_blend;
	
	//Movement
	hspd = 0;
	walkspd = 6.5;
	eggspd = 3.5;

	//Sprite
	sprtdir = 1;

//Gameplay
	//Hit life handler
	hasEgg = true;
	meat = obj_gamemanager.totalLife;
	gotHit = false;
	invulTimer = 0;
	invulDuration = 60;
		
	//Hit lerp handler
	is_being_thrown = false;
	throw_bugu_x = x;
	
	//Movement handler
	is_moving = false;
	
	//Lane
	lane_index = 0;
	target_y = obj_gamemanager.lanes[lane_index];
