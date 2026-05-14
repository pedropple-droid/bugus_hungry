//Data sctructures
	pt_intro_texts = [
	"[shake]OW", 
	"[shake]ME SOLTA AI MERMÃO",//1
	
	//Drop egg input
	
	"Que maluquice, virou crime dormir em paz",
	"Quem é você?",
	"Cadê minha mãe?",
	"Tá, é o seguinte",//5
	"Ela se estressa fácil",
	"E quando ela tá estressada [wave]o bicho pega[/wave]",
	"Rápido, me segura aqui", 
	
	//Walk over egg
	
	"Me diz ai, a gente tá numa caverna?",
	
	//Rock fall
	
	"...Não precisa responder, já percebi",//10
	"...",
	"Tá escutando esse barulho?",
	
	//Arrow warning
	
	"[shake]MEU SANTO PTERODÁCTILO[/shake]", 
	"Isso foi uma... flecha?",
	"Isso não faz nem sentido",//15
	"Ok, chega, me tira daqui logo",
	
	//Walk to edge, rex attack
	
	"...[jitter]Mãe?[/jitter]...",
	"...Acho que ela não consegue sentir meu cheiro...", 
	"...",
	"..Você fede muito...",//20
	"...",
	"...Paia isso ai.",
	
	//Rex scream, rocks falling
	
	"!!", 
	"[shake]CORRE MERMÃO[/shake]"//24
	]

//Text variables
	txt_index = 0;
	drawn = 0;
	t = 150;
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