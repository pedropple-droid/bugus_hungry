 //Check depth
	if (obj_bugu.lane_index <= 0) depth = -1
	if (obj_bugu.lane_index > 0) depth = 1
	
//Check inside collisin
	with (obj_bugu)
	{
	    if (place_meeting(x, y, other)) 
		{
			var _emitter1 = audio_emitter_create();
			var _emitter1_bus = audio_bus_create();
			audio_emitter_bus(_emitter1, _emitter1_bus);
			
			var _ptchValue = random_range(0.85, 1.15)
			var _maxPtch = random_range(1.2, 1.85)
			audio_play_sound_on(_emitter1, snd_collect, 0, 10, 0.2, 0, (clamp(_ptchValue * global.score_multiplier, _ptchValue, _maxPtch)))
			
			global.score_multiplier *= max(1.2 * obj_gamemanager.multGain, 1.05)
			global.multi_timer = 200; 
			instance_destroy(other)
	    };
	};  

//Check inside collisin
	var _objs = [obj_rock_obst, obj_explodingrock, obj_geyser, obj_ruby];
	
	for (var i = 0; i < array_length(_objs); i++) 
	{
	    var _current_obj = _objs[i];
    
	    with (_current_obj) 
	    {
	        for (var j = 0; j < array_length(_objs); j++) 
	        {
	            var _other_obj = instance_place(x, y, _objs[j]);
            
	            if (_other_obj != noone && _other_obj != id) 
	            {
	                var _dir = sign(x - _other_obj.x);
	                if (_dir == 0) _dir = 1; 
	                x += _dir * 48; 
	            };
	        };
	    };
	};