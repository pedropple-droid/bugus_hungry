//Variables
	if (at_crossroads)
	{
		if (global.candropegg) 
		{
			keyboard_check_pressed()
		}
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
	
	if (txt_index == 1) global.candropegg = true;
	if (txt_index == 9) global.canwalk = true;
	if (txt_index == 10) global.rock = true;
	if (txt_index == 13) global.arrow = true;
	if (txt_index == 17) global.canedge = true;