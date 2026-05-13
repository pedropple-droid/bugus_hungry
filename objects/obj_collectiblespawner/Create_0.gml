//These will be passed in from the spawner
	target_item = -1;      // The struct from Collectibles array
	shadow_seq = -1;       // The shadow sequence ID
	falling_seq = -1;      // To track the falling animation
	step_state = 0;        // 0: Shadow, 1: Falling, 2: Spawn Object

//Start the first timer
	alarm[0] = 80;         // Time for the shadow animation