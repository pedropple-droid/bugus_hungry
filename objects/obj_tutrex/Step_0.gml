   //STATE 1: Moving towards Bugu
	if (state == "CHASING") 
	{
	    if (x < obj_bugu.x) x += move_speed; //Move Right
	    if (x > obj_bugu.x) x -= move_speed; //Move Left
    
	    //If bugu leaves region, retreats
	    var _leftW = room_width / 3.6;
	    var _rightW = room_width - _leftW;
		sprite_index = sprt_rexgrowl

	    if (distance_to_object(obj_bugu) <= 300) 
		{ 
	        state = "GROWLING";
	    };
	}

//STATE 2: The Hit Kill
	else if (state == "GROWLING") 
	{
		if (!global.midedge && !has_triggered_mid)
		{
			show_debug_message("growling!")
			global.midedge = true;
			global.endscream = true
			has_triggered_mid = true; 
			obj_tutorial.t = 400;
		}
		if (global.endedge)
		{
			state = "RETREATING"
		};
	}

//STATE 3: Going back off-screen
	else if (state == "RETREATING") 
	{
	    if (x < room_width / 2) 
		{
	        x -= retreat_speed; 
	    } else {
	        x += retreat_speed;
	    };
    
	    if (x < -400 || x > room_width + 400) {
			global.endedge = false
	        instance_destroy();
	    };
	};