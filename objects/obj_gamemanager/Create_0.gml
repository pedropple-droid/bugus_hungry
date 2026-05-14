//Camera
	scr_IngameCamera()

//Pause handler
	global.pause = false;

//bugu call back handler
	//Lane Changing
	lanes = [500, 564, 628];
		
	//Objects
	obstacles = [obj_explodingrock, obj_rock_obst]
    hazards = [obj_geyser, obj_rock_hzrd, obj_arrow, obj_trex] 
	
//Death handler
	//Game over check variable
	global.game_over = false
	global.can_restart = false;

	// Initialize a variable to track if we've already started the timer
	spawn_text_timer = false;

	// Define the function once
	show_restart_text = function() 
	{
		global.can_restart = true; // A flag to tell the Draw event it's okay to show the text
	};

//Score system variable
	global.player_score = 0;
	
//Score multiplier system
	global.multi_timer = 0;
	global.score_multiplier = 1;

//Variables
	scoring = true;
	hzrdStart = 0;
	hzrdSpd = 0;
	eggPoints = false;
	eggMult = 0;
	multTimer = 0;
	multGain = 0;
	purePoint = false;
	PPWin = false;
	PPReset = false;
	totalLife = 0;
	
	global.learning = true;
	global.candropegg = false;
	global.canwalk = false;
	global.rock = false;
	global.rockfinished = false;
	global.arrow = false;
	global.arrowfinished = false;
	global.canedge = false;
	global.isatedge = false;
	global.canstart = false;
	
	
	if (global.learning)
	{
		obj_bugu.x = 0
		obj_bugu.y = 500
	}
	
//Difficulty meter
	switch global.difficulty
		{
			case "easy": 
				hzrdStart = 2;
				hzrdSpd = 0.85;
				eggPoints = false;
				eggMult = 0;
				multTimer = 0.5;
				multGain = 0.65;
				purePoint = false;
				PPWin = false;
				PPReset = false;
				totalLife = 3;
			break;
			
			case "medium":
				hzrdStart = 1;
				hzrdSpd = 1;
				eggPoints = true;
				eggMult = 1;
				multTimer = 1;
				multGain = 1;
				purePoint = true;
				PPWin = false;
				PPReset = false;
				totalLife = 3;
			break;
			
			case "hard":
				hzrdStart = 0.5;
				hzrdSpd = 1;
				eggPoints = true;
				eggMult = 1.5;
				multTimer = 0.8;
				multGain = 1;
				purePoint = true;
				PPWin = false;
				PPReset = true;
				totalLife = 3;
			break;
			case "impossible":
				hzrdStart = 0.30;
				hzrdSpd = 2;
				eggPoints = true;
				eggMult = 3;
				multTimer = 0.5;
				multGain = 3;
				purePoint = true;
				PPWin = true;
				PPReset = true;
				totalLife = 1;
			break;
		};