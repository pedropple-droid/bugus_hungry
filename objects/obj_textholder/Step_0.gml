//Variables
	if (at_crossroads)
	{
		if (global.candropegg && keyboard_check_pressed(global.drop_egg))
		{
			t = 50
			at_crossroads = false
		}
		else if (global.canwalk && obj_bugu.hasEgg)
		{
			t = 50
			at_crossroads = false
		}
		exit
	}
	else
	{
		t--;
	};
	
	var _skip = (t <= 0);

//Follow egg
	x = obj_egg.x
	y = obj_egg.y - 150

//Intro sequence
	if (_skip)
	{
		if (txt_index < array_length(pt_intro_texts) - 1) 
		{
			txt_index++;
			t = 200
		};
	};
	
	if (txt_index == 1)
	{
		global.candropegg = true;
		at_crossroads = true;
	}
	if (txt_index == 9) 
	{
		global.canwalk = true;
		at_crossroads = true;
	}
	if (txt_index == 10) global.rock = true;
	if (txt_index == 13) global.arrow = true;
	if (txt_index == 17) global.canedge = true;