   //STATE 1: Moving towards Bugu
	if (state == "CHASING") 
	{
	    if (x < obj_bugu.x) x += move_speed; //Move Right
	    if (x > obj_bugu.x) x -= move_speed; //Move Left
    
	    //If bugu leaves region, retreats
	    var _leftW = room_width / 3.6;
	    var _rightW = room_width - _leftW;
	    if (obj_bugu.x > _leftW && obj_bugu.x < _rightW) 
		{
	        state = "RETREATING";
	    };
    
	    //If close enough to Bugu, BITE!
	    if (distance_to_object(obj_bugu) < 80) 
		{ 
	        state = "BITING";
	    };
	}

//STATE 2: The Hit Kill
	else if (state == "BITING") 
	{
		if (x < obj_bugu.x) x += bite_speed; //Move Right
	    if (x > obj_bugu.x) x -= bite_speed; //Move Left
		sprite_index = sprt_trex_biting
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
			global.endededege = true
	    };
	};