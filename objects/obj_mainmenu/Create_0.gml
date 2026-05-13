//Options handler
	//Area Check
	fmenu = true
	dfmenu = false
	settings = false
	kbind = false
	credits = false
	drawn = 0
	
	//Main Menu
	menu = [
		{ type:"button", type:"button", name:"[c_white]Play", scribname:"[c_yellow][wave]Play[wave]", ref:"play", waiting:false },
		{ type:"button", name:"[c_white]Settings", scribname:"[c_yellow][wave]Settings[wave]", ref:"settings", waiting:false },
		{ type:"button", name:"[c_white]Credits", scribname:"[c_yellow][wave]Credits[wave]", ref:"credits", waiting:false },
		{ type:"button", name:"[c_white]Exit game", scribname:"[c_yellow][wave]Exit game[wave]", ref:"xtgm", waiting:false },
		];
		
	index  = 0;
	
	menu_max = array_length(menu)
	
	menu_start_y = 380;
	menu_start_x = 150;
	menu_spacing = 80;
	
	changing = false
	
	//Difficulty meter
	df_menu = [
	{ type:"button", name:"Easy", ref:"easy", desc:"Hazards do not speed up as much, and they start at half spawn speed.\n Rewards are diminished" },
	{ type:"button", name:"Medium", ref:"medium", desc:"Hazards speed up as normal, and they start at normal spawn speed.\n Rewards are as intended" },
	{ type:"button", name:"Hard", ref:"hard", desc:"Hazards speed up as normal, but they start at twice the spawn speed.\n Rewards are moderate" },
	{ type:"button", name:"Impossible", ref:"impossible", desc:"You only get one life. Hazards speed up twice as fast, and they start at 2.5x spawn speed.\n Rewards are gigantic" },
	];
	
	df_index = 0;
	
	df_menu_max = array_length(df_menu);
	
	df_menu_start_y = 160;
	df_menu_start_x = display_get_gui_width() / 2;
	df_menu_spacing = 130;
	
	//Settings menu
	st_menu = [
		{ type:"slider", name:"Music",   ref:"MUSvolume", min:0, max:100, step:5, waiting:false  },
		{ type:"slider", name:"Effects", ref:"FXvolume", min:0, max:100, step:5, waiting:false  },
		{ type:"list", name:"Resolution", ref:"resolution", options:["800x600","1280x720","1920x1080"], index: 1, waiting:false },
		{ type:"keybind", name:"Keybinds", ref:"keybind", waiting:false }
		];
	
	st_index = 0;
	
	st_menu_max = array_length(st_menu);

	st_menu_start_y = 220;
	st_menu_start_x = display_get_gui_width() / 2;
	st_menu_spacing = 80;
	
	//Keybind menu
	kb_menu = [
		{ name:"Move Up", ref:"key_up", waiting:false },
		{ name:"Move Down", ref:"key_down", waiting:false },
		{ name:"Move Left", ref:"key_left", waiting:false },
		{ name:"Move Right", ref:"key_right", waiting:false },
		{ name:"Drop Egg", reg:"drop_egg", waiting:false },
	];

	kb_index = 0;

	kb_menu_max = array_length(kb_menu)

	kb_menu_start_y = 120;
	kb_menu_start_x = display_get_gui_width() / 2;
	kb_menu_spacing = 80;
	
	//Credits menu
	cr_menu = "PeterJasen - Main Lead and Developer";
	cr_menu_start_y = 180;
	cr_menu_spacing = 80;
	
//Creates mainmenu art
	mnArt = layer_sprite_create("mainmenuart", 0, 0, sprt_preplay);

//Global variables
	global.overall_score = 0
	//Defaults
		if (!variable_global_exists("FXvolume"))		     global.FXvolume = 50;
		if (!variable_global_exists("MUSvolume"))		    global.MUSvolume = 50;
		if (!variable_global_exists("resolution")) global.resolution = "1280x720";
		if (!variable_global_exists("key_up"))		     global.key_up = ord("W");
		if (!variable_global_exists("key_down"))	   global.key_down = ord("S");
		if (!variable_global_exists("key_left"))	   global.key_left = ord("A");
		if (!variable_global_exists("key_right"))     global.key_right = ord("D");
		if (!variable_global_exists("key_select"))   global.key_select = vk_space;
		if (!variable_global_exists("key_escape"))  global.key_escape = vk_escape;
		if (!variable_global_exists("drop_egg"))	   global.drop_egg = ord("L");
		if (!variable_global_exists("gain"))					global.gain = 0.2;
		if (!variable_global_exists("difficulty"))   global.difficulty = "medium";
		//Loads the score
		scr_loadScore()

//Music
	if !audio_is_playing(snd_menusong)
	{
		sound_handler(snd_menusong, true)
	}

//Camera
	//Initializing Viewports
		view_enabled    = true;
		view_visible[0] = true;
		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = 1280;
		view_hport[0] = 720;
	
	//Setting Viewports
		var _dwidth  = display_get_width();
		var _dheight = display_get_height();
		var _xpos    = (_dwidth / 6);
		var _ypos    = (_dheight / 6);
		window_set_rectangle(_xpos, _ypos, 1280, 720);
		surface_resize(application_surface, 1280, 720)