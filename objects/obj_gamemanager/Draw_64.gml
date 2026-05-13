//MAJOR CHECK
	if (!instance_exists(obj_bugu)) exit
	if (room != rm_game) exit

//TUTORIAL CHECK
	if (global.learning) exit
	
//Death screen manager
	//Draws the game over text
	var _guiW = display_get_gui_width() / 2

	if global.game_over 
	{
		draw_set_alpha(0.9);
		draw_set_colour(c_black);
		draw_rectangle_colour(0, 0, 2560, 720, c_black, c_black, c_black, c_black, false)
		
		//Draw the "Game Over" shake immediately
		scribble("[shake]Game Over![shake]").align(fa_center, fa_middle).draw(_guiW, 300);

		//Start the timer ONLY ONCE
		if !spawn_text_timer 
		{
			call_later(1.5, time_source_units_seconds, show_restart_text);
			spawn_text_timer = true;
		};

		//Draw the space text only after the timer finishes
		if global.can_restart 
		{
			scribble("[wave]press space to play again[wave]").align(fa_center, fa_middle).draw(_guiW, 450);
			scribble("[wave]or press esc to go back to main menu[wave]").align(fa_center, fa_middle).draw(_guiW, 550);
		};
		exit
	};
	
	//Check for framing in life HUD
	var _player = obj_bugu
	if (_player.meat <= 0) frame = 8 //Death frame
	else
	{
		var base = _player.hasEgg ? 0 : 4;
		var offset = 3 - _player.meat;
		frame = base + offset;
	};
	
	//Draws the life hud
	draw_sprite_ext(spr_HudCC, frame, 5, 5, 3, 3, 0, c_white, 1)
