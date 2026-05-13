//Menu check
if fmenu
{
	//Remove menu boxes
	if layer_exists("menubox")
	{
		layer_destroy("menubox");
		drawn = 0
	};
	
	//Creates menu text
	for(var i = 0; i < menu_max; i++)
	{
		var item = menu[i];
		var dy = menu_start_y + (menu_spacing * i);
		var dx = menu_start_x
		var boxY = dy + (35 + (i * 5))
		
		//Highlight selected item
		scribble_color_set(i == index ? c_yellow : c_white);
		
		//Initial text (Name of the setting)
	    var text_label = (i == index ? item.scribname : item.name);
	    var value_display = "";
		var val = variable_global_get(item.ref);
		
		//Safety Check: if val is undefined, default to 0 to prevent crash
        if (is_undefined(val)) val = 0; 
		
		//Switch x pos based on menu item
		switch i
		{
			case 0:
				dx = menu_start_x + 22;
			break;
			case 1:
				dx = menu_start_x + 5;
			break;
			case 2:
				dx = menu_start_x + 9;
			break;
			case 3:
				dx = menu_start_x;
			break;
		};

		//Draw actual options
		scribble(text_label).draw(dx, dy);
		
		//Menu boxes
		var _menubox = sprt_9patch_menu
		
		if (drawn != 4)
		{
			if (!layer_exists("menubox")) layer_create(-1, "menubox")
			_exactmenubox = layer_sprite_create("menubox", 140, boxY, _menubox)
			layer_sprite_xscale(_exactmenubox, 2)
			drawn += 1
		};
	};
	
	//Draws hi-score
	draw_set_colour(c_black)
	var _curW = display_get_gui_width() / 4.5
	var _curH = display_get_gui_height() / 1.9
	
	scribble("[f_skip][wave]Current Hi-Score:[wave] " + string(round(global.overall_score))).draw(_curW,_curH)
};

if dfmenu
{
	//Remove menu boxes
	if layer_exists("menubox")
	{
		layer_destroy("menubox");
		drawn = 0
	}
	
	//Creates menu text
	for (var i = 0; i < df_menu_max; i++)
	{
	    var item = df_menu[i];
	    var dy = df_menu_start_y + (df_menu_spacing * i);
		var dx = df_menu_start_x;
	    var value_display = "";

	    //Set color: Yellow if selected, White if not
	    draw_set_colour(i == df_index ? c_yellow : c_white);
		draw_set_halign(fa_center)
	    draw_text(dx, dy, item.name + "\n" + item.desc);
		
		//Menu box draw
		var boxY = dy + (46 + (i * 10))
		var boxX = dx - 460
		var _menubox = sprt_9patch_menu
		
		if (drawn != 5)
		{
			if (!layer_exists("menubox")) layer_create(-1, "menubox")
			_exactmenubox = layer_sprite_create("menubox", boxX, boxY, _menubox)
			layer_sprite_xscale(_exactmenubox, 16);
			layer_sprite_yscale(_exactmenubox, 1.6);
			drawn += 1
		};
	};
	
	
	//Reset colour
	draw_set_colour(c_white);
}

//Menu check
if settings
{
	//Remove menu boxes
	if layer_exists("menubox")
	{
		layer_destroy("menubox");
		drawn = 0
	}
	
	//Creates menu text
	for (var i = 0; i < st_menu_max; i++)
	{
	    var item = st_menu[i];
	    var dy = st_menu_start_y + (st_menu_spacing * i);
		var dx = st_menu_start_x
	    var value_display = "";

	    //Set color: Yellow if selected, White if not
	    draw_set_colour(i == st_index ? c_yellow : c_white);

	    //Switch logic to prepare the display value and extra graphics
	    switch (item.type) 
	    {
	        case "slider":
	            var sliderVal = variable_global_get(item.ref);
	            if (is_undefined(sliderVal)) sliderVal = 50; 
	            value_display = string(sliderVal);
	        break;

	        case "list":
	            value_display = item.options[item.index];
	        break;

	        case "keybind":
	            value_display = "(Press Enter or Space)";
	        break;
	    };
		
		//Menu box draw
		var boxY = dy + (28 + (i * 5))
		var boxX = dx - 200
		var _menubox = sprt_9patch_menu
		
		if (drawn != 4)
		{
			if (!layer_exists("menubox")) layer_create(-1, "menubox")
			_exactmenubox = layer_sprite_create("menubox", boxX, boxY, _menubox)
			layer_sprite_xscale(_exactmenubox, 8);
			drawn += 1
		}
		
		//Before drawing text, adjust x pos
		switch i
		{
			case 0:
				dx = st_menu_start_x - 38;
			break;
			case 1:
				dx = st_menu_start_x - 48;
			break;
			case 2:
				dx = st_menu_start_x - 87;
			break;
			case 3:
				dx = st_menu_start_x - 144;
			break;
		};
	    draw_text(dx, dy, item.name + ": " + value_display);
	};
	
	
	//Reset colour
	draw_set_colour(c_white);
};

//Menu check
if kbind
{
	//Remove menu boxes
	if layer_exists("menubox")
	{
		layer_destroy("menubox");
		drawn = 0
	}
	
	//Font color	
	draw_set_colour(c_white);
	draw_text(640, 60, "Controls");

	//Draw menu
	for (var i = 0; i < array_length(kb_menu); i++)
	{
		var item = kb_menu[i];
		var dx = kb_menu_start_x
		var dy = kb_menu_start_y + (kb_menu_spacing * i);

		draw_set_colour(i == kb_index ? c_yellow : c_white);

		var text = item.name + ": ";

		if (item.waiting) text += "Press key...";
		
		else text += key_to_string(variable_global_get(item.ref));

		//Menu box draw
		var boxY = dy + (28 + (i * 5));
		var boxX = dx - 200;
		var boxWidth = 64 * 6.3;
		var centerX = boxX + (boxWidth /2);
		var _menubox = sprt_9patch_menu;
		
		if (drawn != 5)
		{
			if (!layer_exists("menubox")) layer_create(-1, "menubox")
			_exactmenubox = layer_sprite_create("menubox", boxX, boxY, _menubox)
			layer_sprite_xscale(_exactmenubox, 8);
			drawn += 1
		}

		//Before drawing text, adjust x pos
		switch i
		{
			case 0:
				dx = kb_menu_start_x - 38;
			break;
			case 1:
				dx = kb_menu_start_x - 48;
			break;
			case 2:
				dx = kb_menu_start_x - 87;
			break;
			case 3:
				dx = kb_menu_start_x - 144;
			break;
			case 4:
				dx = kb_menu_start_x - 87;
			break;
		};

		draw_set_halign(fa_center)
		draw_text(centerX, dy, text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	};

};

//Menu check
if credits
{
	//Remove menu boxes
	if layer_exists("menubox")
	{
		layer_destroy("menubox");
		drawn = 0
	}
	
	//Chooses font
	draw_set_colour(c_white);

	//Draws font text
	var dy = cr_menu_start_y + cr_menu_spacing
	draw_text(320, dy, cr_menu);

};