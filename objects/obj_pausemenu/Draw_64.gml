//Black screen
	if (global.pause)
	{
		draw_set_alpha(0.6);
		draw_rectangle_colour(0, 0, 2560, 720, c_black, c_black, c_black, c_black, false)
		if (!setting && !keybind)
		{
			scribble(text).draw(guiW/2.5, guiH/2.3);
		}
	}
	else
	{
		draw_set_alpha(1);
	};

//Draws menu
	if (global.pause)
	{
		if (fmenu)
		{
			for(var i = 0; i < menu_max; i++)
			{
				var item = menu[i];
				var dy = menu_start_y + (menu_spacing * i);
		
				// Highlight selected item
				draw_set_colour(i == index ? c_yellow : c_white);
		
				// Initial text (Name of the setting)
			    var text_label = item.name;
		
			    var value_display = "";
				var val = variable_global_get(item.ref);
				// Safety Check: if val is undefined, default to 0 to prevent crash
		        if (is_undefined(val)) val = 0; 
		
				draw_text(150, dy, text_label);
			};
		}
		
		if (setting)
		{
			for (var s = 0; s < st_menu_max; s++)
			{
			    var item = st_menu[s];
			    var dy = menu_start_y + (menu_spacing * s);
			    var value_display = "";

			    //Set color: Yellow if selected, White if not
			    draw_set_colour(s == st_index ? c_yellow : c_white);

			    //Switch logic to prepare the display value and extra graphics
			    switch (item.type) 
			    {
			        case "slider":
			            var sliderVal = variable_global_get(item.ref);
			            if (is_undefined(sliderVal)) sliderVal = 70; 
			            value_display = string(sliderVal);
			            draw_sprite_ext(spr_ControlerSound, sliderVal, 650, dy, 2, 2, 0, c_white, 1);
			       		draw_text(400, dy, item.name + ": " + value_display);
				   break;

			        case "list":
			            value_display = item.options[item.st_index];
						draw_text(400, dy, item.name + ": " + value_display);
			        break;

			        case "keybind":
			            value_display = "(Press Enter or Space)";
						draw_text(400, dy, item.name + ": " + value_display);
			        break;
					
					case "return":
						draw_text(400, dy, item.name + value_display);
					break;
			    };
			};
		};
	
		if (keybind)
		{
			//Font color	
			draw_set_colour(c_white);
			draw_text(400, 100, "Controls");

			//Draw menu
			for (var k = 0; k < array_length(kb_menu); k++)
			{
				var item = kb_menu[k];
				var dy = menu_start_y + (menu_spacing * k);

				draw_set_colour(k == kb_index ? c_yellow : c_white);

				var kb_text = item.name + ": ";
				
				if (item.type == "keybinder")
				{
					if (!item.waiting) kb_text += key_to_string(variable_global_get(item.ref));
					else kb_text += "Press any key...";
				}
				else
				{
					kb_text = item.name
				};
				draw_text(400, dy, kb_text);
			};
		};
	};
