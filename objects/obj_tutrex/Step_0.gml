   //STATE 1: Moving towards Bugu
	if (state == "CHASING") 
	{
		global.midedge = true
		obj_tutorial.at_crossroads = true
		
	    if (x < obj_bugu.x) x += move_speed; //Move Right
	    if (x > obj_bugu.x) x -= move_speed; //Move Left
    
	    //If bugu leaves region, retreats
	    var _leftW = room_width / 3.6;
	    var _rightW = room_width - _leftW;
		
	    if (distance_to_object(obj_bugu) <= 300) 
		{ 
	        state = "GROWLING";
	    };
	}

//STATE 2: The Hit Kill
	else if (state == "GROWLING") 
	{
		show_debug_message("growling")
		sprite_index = sprt_growling;
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
	        instance_destroy();
			global.endedge = true
	    };
	};