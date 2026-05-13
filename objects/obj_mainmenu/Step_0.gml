//Menu input control
	//Input handler
	var key_up    = keyboard_check_pressed(ord("W"))  || keyboard_check_pressed(vk_up);
	var key_down  = keyboard_check_pressed(ord("S"))  || keyboard_check_pressed(vk_down);
	var key_left  = keyboard_check_pressed(ord("A"))  || keyboard_check_pressed(vk_left);
	var key_right = keyboard_check_pressed(ord("D"))  || keyboard_check_pressed(vk_right);
	var key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
	var key_escape = keyboard_check_pressed(vk_escape);
	
	var current = ( fmenu ? menu[index] : ( settings ? st_menu[st_index] : ( kbind ? kb_menu[kb_index] : df_menu[df_index] ) ) )
	var curr_index = ( fmenu ? index : ( settings ? st_index : ( kbind ? kb_index : df_index ) ) )
	var curr_menu_max = ( fmenu ? menu_max : ( settings ? st_menu_max : ( kbind ? kb_menu_max : df_menu_max ) ) )
	var current_ref = current.ref
	
	//Navigation handler
	if key_up
	{
		curr_index--;
		if (curr_index < 0) curr_index = (curr_menu_max - 1);
		sound_handler(snd_movemenu, , , false)
	};

	if key_down
	{
		curr_index++;
		if (curr_index >= curr_menu_max) curr_index = 0;
		sound_handler(snd_movemenu, , , false)
	};
	
	if fmenu
	{
		//Changing variables
		index = curr_index
	
		switch (current.type)
		{
			case "button":
			if key_select
			{
				sound_handler(snd_selectother, , , false)
				if (current_ref == "play") 
				{
					fmenu = false;
					dfmenu = true;
					io_clear();
				};
				if (current_ref == "settings")
				{
					fmenu = false;
					settings = true;
				};
				if (current_ref == "credits") 
				{
					fmenu = false;
					credits = true;
				};
				if (current_ref == "xtgm") game_end();
			};
		}
	}
	
	else if dfmenu
	{
		df_index = curr_index
		
		if key_escape
		{
			dfmenu = false;
			fmenu = true;
		};
		
		if changing
		{
			if (keyboard_check_pressed(global.key_select)) || !audio_is_playing(snd_rexy)
			{
				dfmenu = false;
				changing = false;
				audio_stop_sound(snd_rexy);
				room_goto(rm_game);
			};
			exit
		};
		
		switch (current.type)
		{
			case "button":
			if key_select
			{
				if (current_ref == "easy")
				{
					global.difficulty = "easy";
				};
				
				if (current_ref == "medium")
				{
					global.difficulty = "medium";
				};
				
				if (current_ref == "hard")
				{
					global.difficulty = "hard";
				};
				
				if (current_ref == "impossible")
				{
					global.difficulty = "impossible";
				};
				layer_sprite_change(mnArt, sprt_postplay);
				audio_stop_sound(snd_menusong);
				sound_handler(snd_rexy);
				changing = true;
			};
		};
	}
	
	else if settings
	{
		//Changing variables
		st_index = curr_index
		
		if key_escape
		{
			settings = false;
			fmenu = true;
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
				if (key_left)  current.index--;
				if (key_right) current.index++;

				var len = array_length(current.options);
			
				if (current.index < 0) current.index = len - 1;
				if (current.index >= len) current.index = 0;
			break;

			case "keybind":
				if (key_select) 
				{
					settings = false;
					kbind = true;
				};
			break;
		};
	}
	
	else if kbind
	{
		//Changing variables
		kb_index = curr_index
		
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
		
		if key_select
		{
		    current.waiting = true;
		    keyboard_lastkey = -1;
		};
		
		if key_escape
		{
			kbind = false;
			settings = true;
		};
	}
	
	else if credits
	{
		if key_escape
		{
			credits = false;
			fmenu = true;
		};
	};
	

