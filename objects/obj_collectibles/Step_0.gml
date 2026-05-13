//Collectible spawner handler
	var _count = array_length(Collectibles);

	for (var i = 0; i < _count; i++) 
	{
	    var _item = Collectibles[i];
		
		if (!_item.active) exit 
		
	    _item.timer -= 1;

	    if (_item.timer <= 0)
		{
	        _item.timer = _item.rate;
			
			//Randomizing fall pos
			switch _item.name
			{
				case "ruby":
				fall_rando_x = irandom_range(0.7, 1);
				
				case "banana":
				fall_rando_x = irandom_range(1, 1.3);
			};
			
	        //Calculate position (logic is now written ONLY ONCE)
	        var lane_target = clamp(obj_bugu.lane_index + choose(-1, 0, 1), 0, array_length(obj_gamemanager.lanes) - 1);
	        var future_x = obj_bugu.x + obj_bugu.hspd * 40 * fall_rando_x;
	        var spawn_x = irandom_range(future_x - 130, future_x + 130);
	        var spawn_y = obj_gamemanager.lanes[lane_target];

	        //Create the shadow sequence
	        var _seq = layer_sequence_create("Instances", spawn_x, spawn_y, seq_collectibleShadow);
        
	        //Pass data to the timer/alarm using a temporary "controller" object 
	        
			var _inst = instance_create_layer(spawn_x, spawn_y, "Instances", obj_collectiblespawner);
	        _inst.target_item = _item; 
	        _inst.shadow_seq = _seq;
	    };
	};