//Data sctructures
	pt_intro_texts = [
	"[shake]OW", //1
	"ME SOLTA AI MERMÃO[/shake]",
	
	//Drop egg input
	
	"Que maluquice, não se pode dormir em paz",
	"Quem é você?",
	"Cadê minha mãe?", //5
	"E laia...",
	"Tá, é o seguinte",
	"Ela se estressa fácil",
	"E quando ela tá estressada [wave]o bicho pega[/wave]",
	"Rápido, me segura aqui", //10
	
	//Walk over egg
	
	"Me diz ai, a gente tá numa caverna?",
	
	//Rock fall
	
	"...Não precisa responder, já percebi",
	"...",
	"Tá escutando esse barulho?",
	
	//Arrow warning
	
	"[shake]MEU SANTO PTERODÁCTILO[/shake]", //15
	"Isso foi uma... flecha?",
	"Isso não faz nem sentido",
	"Ok, chega, me tira daqui logo",
	
	//Walk to edge, rex attack
	
	"...[jitter]Mãe?[/jitter]...",
	"...Acho que ela não consegue sentir meu cheiro...", //20
	"...",
	"..Você fede muito...",
	"...",
	"...Paia isso ai.",
	
	//Rex scream, rocks falling
	
	"!!", //25
	"[shake]CORRE MERMÃO[/shake]",
	]
	
//Text variables
	txt_index = 0;
	drawn = 0;
	t = 200;
	at_crossroads = false;
	var _current_text = pt_intro_texts[txt_index];

	scribble_object = scribble(_current_text)
		.starting_format("f_skip", c_white)
		.sdf_border(c_green, 1)
		.sdf_shadow(c_black, 0.5, 2, 2, 16)
		.wrap(1200);
		
		typist = scribble_typist();
		typist.in(1, 0.5);
		typist.sound(snd_typeegg, 20, 0.8, 1.2, 1)