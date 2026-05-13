  //Score draw
	draw_set_color(c_white);	//Set the text color
	
	var _text = "Score: " + string(round(global.player_score));

	if hit_timer > 0	//Check for shake effect
	{
	    _text = "[shake]Score: [shake]" + string(global.player_score);
	    hit_timer -= 1;	// Count down the timer
	}
	
	scribble(_text).draw(900, 20);

//Multiplier draw
	var _multi = string(global.score_multiplier)
	
	scribble(_multi).draw(900, 60);