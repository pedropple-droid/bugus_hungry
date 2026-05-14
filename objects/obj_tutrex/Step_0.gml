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