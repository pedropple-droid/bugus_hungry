//MAJOR CHECK
	if (!instance_exists(obj_egg))
	{
		instance_create_layer(x, y, "Instances", obj_egg)
	}

//General handler
	//Return checks
	if sprite_index == sprt_death exit
	if global.pause {sprite_index = idle_sprt_bugu exit;}
	if (room != rm_game) exit;

	//Get player input
	var key_left = keyboard_check(global.key_left);
	var key_right = keyboard_check(global.key_right);
	var key_down = keyboard_check(global.key_down);
	var key_up = keyboard_check(global.key_up);
	var drop_egg = keyboard_check(global.drop_egg);
	
	var _move = key_right - key_left;

	//Movement check
	if (_move != 0) is_moving = true
	else is_moving = false
	
//Camera Handler
	//Advanced Movement Variables
	var _buguX = obj_bugu.x
	var _viewX = camera_get_view_x(view_camera[0]);
	var _viewW = camera_get_view_width(view_camera[0]);
	if (invulTimer == 0) var _gotoX = x + (_move * 50) - (_viewW * 0.5)
	else _gotoX = _buguX - (_viewW * 0.5);
	var _newX = lerp(_viewX, _gotoX, 0.2);
	
	//Camera ViewPos
	camera_set_view_pos(view_camera[0], _newX, y)
	
//Game Handler//
	//Tutorial
	if (!global.canwalk)
	{
		if (point_distance(x, y, 880, 500) > 5) && (!global.learning)
		{
			move_towards_point(1500, 500, eggspd)
			sprite_index = walk_sprt_bugu
		}
		else if (point_distance(x, y, 880, 500) <= 5)
		{
			global.learning = true
		}
		else if (obj_tutorial.txt_index == 1)
		{
			speed = 0
			sprite_index = idle_sprt_bugu
		}
		exit
	}
	
	
	//Useful variables
	var new_lane = lane_index
	currLane = lane_index //Used for depth check

	//Movement
	if (!is_being_thrown)
	{
		hspd = _move * walkspd;
		if (place_meeting(x + hspd, y, obj_gamemanager.obstacles))
		{
			while (!place_meeting(x + sign(hspd), y, obj_gamemanager.obstacles))
			{
				x += sign(hspd)
			};
			hspd = 0;
		};
		x += hspd;
	};
	
	if (is_moving)
	{
		sprtdir = sign(_move);
		sprite_index = walk_sprt_bugu
			
		if (!is_being_thrown)
		{
			if (hasEgg) global.player_score += 0.1;
		};
	}
		
	else if (!is_being_thrown)
	{
		sprite_index = idle_sprt_bugu
	};
		
	image_xscale = sprtdir
		
	if (!hasEgg && meat <= 0)
	{
		sprite_index = sprt_death
		var _emitter1 = audio_emitter_create();
		var _emitter1_bus = audio_bus_create();
		audio_emitter_bus(_emitter1, _emitter1_bus);
		//Creation of audio bus and sound play
		_emitter1_bus.effects[0] = audio_effect_create(AudioEffectType.Bitcrusher,	
		{
			gain: 0.8, factor: 5, resolution: 16, mix: 0.3 
		});
		audio_play_sound_on(_emitter1, snd_buguhurt, 0, 10, choose(0.8, 1) , 0, random_range(0.75, 1.25))
		exit
	}
	//Damage handler
		//Damage detection
		if (place_meeting(x, y, obj_gamemanager.hazards) && !is_being_thrown)
		{
			if (invulTimer <= 0)
			{
				invulTimer = invulDuration;
				is_being_thrown = true;
				throw_bugu_x = x - (sprtdir * 100);
				obj_scoregui.hit_timer = 30
			
				//Sound
				var _emitter1 = audio_emitter_create();
				var _emitter1_bus = audio_bus_create();
				audio_emitter_bus(_emitter1, _emitter1_bus);
				_emitter1_bus.effects[0] = audio_effect_create(AudioEffectType.Bitcrusher,	
				{
					gain: 0.8, factor: 5, resolution: 16, mix: 0.3 
				});
				audio_play_sound_on(_emitter1, snd_buguhurt, 0, 10, choose(0.1, 0.2), 0, random_range(0.75, 1.25))
			
				if hasEgg
				{
					with (obj_egg)
					{
						isThrown = true;
						t = 0;

						start_x = x;
						start_y = y;

						lane_variation = choose(-1, 0, 1);
						lane_target = clamp(lane_index + lane_variation, 0, array_length(obj_gamemanager.lanes) - 1);
						
						randomDir = choose( x - (other.sprtdir * irandom_range(200, 600)) , x + (other.sprtdir * irandom_range(200, 600)))
						future_x = randomDir
						future_y = obj_gamemanager.lanes[lane_target];
					}
					hasEgg = false
				}
				else 
				{
					meat -= 1;
				};
			};
		};
		
		//Invulnerability timer
		if (invulTimer > 0)
		{
			invulTimer -= 1;
			if (is_being_thrown)
			{
				sprite_index = hit_sprt_bugu
				image_blend = make_colour_hsv(255, 255, random(255))
			}
			else
			{
				image_blend = base_color;
			};
		};
		
		//Knockback
		if (is_being_thrown)
		{
			var _nextX = lerp(x, throw_bugu_x, 0.15);
		
			if (place_meeting(_nextX, y, obj_gamemanager.obstacles)) is_being_thrown = false;
			else x = _nextX;
			
			if (abs(x - throw_bugu_x) < 2) is_being_thrown = false;
		};
		
	//Egg
		if (place_meeting(x, y, obj_egg) && !hasEgg) hasEgg = true
	
	//Lanes Change
		if (y == target_y)
		{
			if (key_up) new_lane -= 1;
			if (key_down) new_lane += 1;
		};
		
		new_lane = clamp(new_lane, 0, array_length(obj_gamemanager.lanes) - 1);
		
		//Check for obstacles in defined lane
		var blocked = place_meeting(x, obj_gamemanager.lanes[new_lane], obj_gamemanager.obstacles);
		
		//Commit lane change
		if (!blocked && y == target_y)
		{
			lane_index = new_lane;
			target_y = obj_gamemanager.lanes[obj_bugu.lane_index];
		};
		
		//Lerp movement handler\
		y = lerp( y, target_y, 0.3);
		if (abs(y - target_y) < 1) y = target_y;
		
//Room constraint
	var _sprtW = sprite_width / 2
	x = clamp(x, 0 - _sprtW, room_width - _sprtW);

//Debug handler
	if (keyboard_check_pressed(vk_f2)) 
	{
		if (meat < 3) meat += 1;
	};
	
	if (keyboard_check_pressed(vk_f1)) 
	{
		if (meat > 0) meat -= 1;
	};