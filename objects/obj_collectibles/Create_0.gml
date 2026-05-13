//MAJOR CHECK
	if (!instance_exists(obj_bugu)) exit
	
//Randomise set seed
	randomise()

//Collectibles arrays
	Collectibles = [
	    { 
	        name: "ruby",
			active: true,
	        timer: 0, 
	        rate: 116, 
	        seq_fall: seq_fallingruby, 
	        obj: obj_ruby,
	    },
	    { 
	        name: "banana", 
			active: obj_gamemanager.purePoint ? true : false,
	        timer: 0, 
	        rate: 334, 
	        seq_fall: seq_fallingbanana, 
	        obj: obj_banana,
	    }
	];