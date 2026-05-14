//MAJOR CHECK
	if (!instance_exists(obj_bugu)) exit
	if (room != rm_game) exit
		
	//Create tutorial object
	if (!instance_exists(obj_tutorial) && global.learning = true)
	{
		instance_create_layer(x, y - 150, "Instances", obj_tutorial)
	};
	
	if (!global.canstart) exit

//UI creator
	if !instance_exists(obj_rocks) instance_create_layer(x, y, "UI_Layer", obj_rocks)
	if !instance_exists(obj_scoregui) instance_create_layer(x, y, "UI_Layer", obj_scoregui)
	if !instance_exists(obj_collectibles) instance_create_layer(x, y, "UI_Layer", obj_collectibles)
	if !instance_exists(obj_linehazards) instance_create_layer(x, y, "UI_Layer", obj_linehazards)
	
//Points handler
	if obj_bugu.is_moving and obj_bugu.hasEgg and eggPoints
	{
		global.player_score += 1 * eggMult
	};
	
	if (global.multi_timer <= 0) 
	{
		global.score_multiplier = 1;
		global.multi_timer = 0;
	}
	else
	{
		global.multi_timer -= 1 * multTimer
	};

//Events for sides of the screen
	//Variables
	var _leftW = room_width / 3.6;
	var _rightW = room_width - _leftW;
	var _trex = obj_trex

	//Trex spawner
	if (obj_bugu.x < _leftW || obj_bugu.x > _rightW)
	{
		if !instance_exists(_trex) 
		{
			var _spawn_x;
		
			if (obj_bugu.x < _leftW) 
			{
			    _spawn_x = -350; // Left side, off-screen
			} else {
			    _spawn_x = room_width + 350; // Right side, off-screen
			};
			instance_create_layer(_spawn_x, 384, "Instances", _trex)
		};
	};