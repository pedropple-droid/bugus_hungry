//MAJOR CHECK
	if (!instance_exists(obj_bugu)) exit
//Randomise set seed
	randomise()
	
//IDs
	shadow_seq = seq_rockShadow
	falling_rock = seq_fallingrock
	hzrd_obj = obj_rock_hzrd
	
	active_shadow_id = -1;
	active_falling_id = -1;
	active_rock_id = -1;
	
//Falling logic
	predict_time = 100;
	cam_shake = 0;

//Timing logic
	timer = 0;
	rate = 200;