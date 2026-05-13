//MAJOR CHECK
	if (!instance_exists(obj_bugu)) exit
	
//Menu input control
	//Local Variables
	var key_up   = (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up));
	var key_down = (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down));
	var key_select  = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter));
	var key_left = (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left));
	var key_right = (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right));

	//Score variable
	currScore = round(global.player_score);
	text = "[wave]Score: [wave]" + string(currScore);
	
	//Checks for game_over restart
	if global.game_over
	{
		if (keyboard_check_pressed(vk_space))
		{
			room_restart()
			global.game_over = false
			global.pause = false
			obj_gamemanager.spawn_text_timer = false
		};
		
		if(keyboard_check_pressed(vk_escape))
		{
			room_goto(rm_mainmenu)
			global.game_over = false
			global.pause = false
			obj_gamemanager.spawn_text_timer = false
		}
		exit
	};
	
	if (fmenu)
	{
		var current = (menu[index])
		var current_ref = current.ref
		switch (current.type)
		{
			case "button":
				if key_select
				{
					sound_handler(snd_selectother, , , false)
					if (current_ref == "continue") 
					{
						audio_stop_sound(snd_menusong)
						sound_handler(snd_selectother, , , false)
						global.pause = false
						fmenu = false
					};
					
					if (current_ref == "settings") 
					{
						setting = true
						fmenu = false
					};
					
					if (current_ref == "xtgm") 
					{
						global.pause = false
						fmenu = false
						room_goto(rm_mainmenu)
					};
				};
		};
	
		if key_up
		{
			index--;
			if (index < 0) index = (menu_max - 1);
			sound_handler(snd_movemenu, , , false)
		};

		if key_down
		{
			index++;
			if (index >= menu_max) index = 0;
			sound_handler(snd_movemenu, , , false)
		};
	}
	
	else if (setting)
	{
		var current = (st_menu[st_index])
		if key_up
		{
			st_index--;
			if (st_index < 0) st_index = (st_menu_max - 1);
		};

		if key_down
		{
			st_index++;
			if (st_index >= st_menu_max) st_index = 0;
		};

		switch current.type
		{
			case "slider":
				var val = variable_global_get(current.ref);

				if (key_left)  val -= current.step;
				if (key_right) val += current.step;

				val = clamp(val, current.min, current.max);
				variable_global_set(current.ref, val);
			break;

			case "list":
				if (key_left)  current.st_index--;
				if (key_right) current.st_index++;

				var len = array_length(current.options);
			
				if (current.st_index < 0) current.st_index = len - 1;
				if (current.st_index >= len) current.st_index = 0;
			break;

			case "keybind":
				if (key_select) 
				{
					setting = false;
					keybind = true;
				}
			break;
				
			case "return":
				if (key_select)
				{
					setting = false;
					fmenu = true
				}
			break;
		};
	}
	
	else if (keybind)
	{
		var current = (kb_menu[kb_index])
		if (current.type == "keybinder")
		{
			if key_select
			{
				current.waiting = true;
				keyboard_lastkey = -1;
				io_clear();
			};
				
			if current.waiting
			{
				if keyboard_check_pressed(vk_anykey)
				{
					if (keyboard_lastkey != vk_enter && keyboard_lastkey != vk_space && keyboard_lastkey != vk_escape)
					{
						variable_global_set(current.ref, keyboard_lastkey);
						current.waiting = false;
						keyboard_lastkey = -1;
					};
				};
				exit;
			};
		};
			
		if (current.type == "return") 
		{
			if key_select
			{
				keybind = false
				setting = true
			};
		};
			
		if key_up
		{
			kb_index--;
			if (kb_index < 0) kb_index = (kb_menu_max - 1);
		};

		if key_down
		{
			kb_index++;
			if (kb_index >= kb_menu_max) kb_index = 0;
		};
	};