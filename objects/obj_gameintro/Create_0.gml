//Data structures
	en_intro_texts = 
	[
	"HEY, can you hear me out there?",
	"Well, this is awkward",
	"[shake]LOOKOUT![/shake]",
	"",
	"Welp, that was close, im greatful you performed the [c_red][wave]GO UP[/wave][/c] action" + ", wich is inputed by the[c_red][wave] " + key_to_string(global.key_up) +"[/wave][/c] KEY, right?",
	"[c]I reckon you could've also performed the [c_red][wave]GO DOWN[/wave][/c] action" + ", wich is inputed by the[c_red][wave] " + key_to_string(global.key_down) +"[/wave][/c] KEY, you would've been okay either direction",
	"!",
	"...",
	"Did you... mean to dodge that lava?",
	"I wouldn't have guessed that rocks can explode and turn into lava until now",
	"...",
	"I also feel like i need to tell you another thing",
	"You can change your 'keybinds' in your 'settings' menu by 'pressing' the key " + key_to_string(global.key_escape)+ "'ingame' or in 'settings inside the main menu'",
	"If you tested that now, you've noticed you can skip this 'intro', that's on you if you do skip it",
	"You're not 'playing' yet",
	"...",
	"I don't know what any of that means or why did i have the feeling to tell you that",
	"Also, ther-",
	"[shake]LOOKOUT![/shake]",
	"",
	"Was that an arrow?",
	"Who's throwing arrows?",
	"Are there even arrows in our time current time in history?",
	"Wait.",
	"You sound like an homosapien",
	"I feel like i'm a dinosaur",
	"Should we be coexisting?",
	"This is awkward, again",
	"Anyways, as i was saying, there's also a 'difficulty' meter in the settings",
	"Have fun doing harder stuff, wich makes absolutely zero sense in a survival enviroment",
	"But you do you",
	"Now, i see a cave up ahead, i need to remind you",
	"I'm an egg, we've got an angry mom following us, and you should be careful to not let a rock fall on your head if you're not holding me",
	"Or step on lava",
	"Or get hit by an arrow while we're at it",
	"I've got a hard shell, and your head might be hard but it's not harder than my shell",
	"Well anyways, have fun trying to survive while holding a 50 pound egg!",
	"Hope your 'dopamine receptors' enjoy it",
	"Whatever that means",
	];
	
	
	
	seq_intros = 
	[
	seq_intro0,
	seq_intro1,
	seq_intro2,
	seq_intro3,
	seq_intro4,
	];
	
//Tracker
	txt_index = 0;
	seq_index = 0;
	target_seq = seq_index
	curr_txt = "";

//Start intro
	current_seq = layer_sequence_create("Instances", x, y, seq_intro0);
	transition_seq = layer_sequence_create("Instances", x, y, seq_trans);
	