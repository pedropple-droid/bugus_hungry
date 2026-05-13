//Variables
	pauseSurf = 1;
	pauseSurfBuffer = 1;

	resW = display_get_width()
	resH = display_get_height()

	currScore = round(global.player_score)
	text = "[wave]Score: [wave]" + string(currScore);
	guiW = display_get_gui_width()
	guiH = display_get_gui_height()
	
	menu_start_y = guiH/3.5;
	menu_spacing = 100;
	
	setting = false
	keybind = false
	fmenu = false

//Menu array
	menu = [
		{ name:"Resume", type:"button", ref:"continue" },
		{ name:"Settings", type:"button", ref:"settings" },
		{ name:"Exit game", type:"button", ref:"xtgm" },
	];
	
	index = 0;
	menu_max = array_length(menu)
	
//Settings array
	st_menu = [
		{ name:"Music", type:"slider", ref:"MUSvolume", min:0, max:100, step:5 },
		{ name:"Effects", type:"slider", ref:"FXvolume", min:0, max:100, step:5 },
		{ name:"Resolution", type:"list", ref:"resolution", options:["800x600","1280x720","1920x1080"], st_index: 1 },
		{ name:"Keybinds", type:"keybind", ref:"keybind" },
		{ name:"Return", type:"return", ref:"return" },
	];
	
	st_index = 0;
	st_menu_max = array_length(st_menu);
	
//Keybind array
	kb_menu = [
		{ name:"Move up" ,type:"keybinder", ref:"key_up", waiting:false },
		{ name:"Move Down" ,type:"keybinder", ref:"key_down", waiting:false },
		{ name:"Move Left" ,type:"keybinder", ref:"key_left", waiting:false },
		{ name:"Move Right" ,type:"keybinder", ref:"key_right", waiting:false },
		{ name:"Return" ,type:"return", ref:"return" },
	];

	kb_index = 0;
	kb_menu_max = array_length(kb_menu)