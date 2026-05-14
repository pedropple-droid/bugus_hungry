//Follow egg
	x = obj_egg.x
	y = obj_egg.y - 150
	
//Variables
	if (at_crossroads)
	{
		if (global.candropegg && keyboard_check_pressed(global.drop_egg))
		{
			t = 0
			at_crossroads = false
		}
		else if (global.canwalk && obj_bugu.hasEgg)
		{
			t = 0
			at_crossroads = false
		}
		else if (global.rock)
		{
			t = 0
			global.rock = false;
			at_crossroads = false;
		}
		else if (global.arrow)
		{
			t = 0
			global.arrow = false;
			at_crossroads = false;
		}
		else if (global.endededge)
		{
			t = 0
			global.canedge = false;
			global.endededge = false;
			at_crossroads = false;
		}
		else if (global.canstart)
		{
			t = 0
			global.learning = false
			at_crossroads = false
		}
		exit
	};
	
	t--;
	
	var _skip = (t <= 0);

//Intro sequence
	if (_skip)
	{
		if (txt_index < array_length(pt_intro_texts) - 1) 
		{
			txt_index++;
			t = 10
		};
	};
	
	switch txt_index
	{
		case 1:
			global.candropegg = true;
			at_crossroads = true;
			show_debug_message("CASE 1")
		break;
		
		case 8:
			global.canwalk = true;
			at_crossroads = true;
			show_debug_message("CASE 8")
		break;
		
		case 9:
			if !instance_exists(obj_tutrock)
			{
				show_debug_message("CASE 9")
				instance_create_layer(x, y, "Instances", obj_tutrock)
			};
		break;
		
		case 12:
			if !instance_exists(obj_warningsign) 
			{
				show_debug_message("CASE 12")
				instance_create_layer(x, 628, "Instances", obj_warningsign)
			};
		break;
		
		case 16:
			global.canedge = true;
			if !instance_exists(obj_tutrex) instance_create_layer(x, y, "Instances", obj_tutrex)
			{
				show_debug_message("CASE 16")
			};
		break;
		
		case 24:
			global.canstart = true;
			at_crossroads = true;
			show_debug_message("CASE 24")
		break;
	};