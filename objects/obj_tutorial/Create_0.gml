//Data sctructures
	pt_intro_texts = 
	[
	"[shake][delay, 80]OW", 
	"[shake]ME SOLTA AI MERMÃO",//1
	//Drop egg input
	
	"[delay, 400]Que maluquice[delay, 160], virou crime dormir em paz",
	"[speed, 0.7]Quem é você?",
	"[speed, 0.7]Cadê minha mãe?",
	"Tá[delay, 160], é o seguinte",//5
	"Ela se estressa fácil",
	"E quando ela tá estressada [delay, 160][speed, 0.25][wave]o bicho pega[/wave]",
	"Rápido[delay, 160], me segura aqui", 
	
	//Walk over egg
	
	"Me diz ai[delay, 160], a gente tá numa caverna?",
	
	//Rock fall
	
	"...Não precisa responder[delay, 160], já percebi",//10
	"...",
	"Tá escutando esse barulho?",
	
	//Arrow warning
	
	"[shake][speed, 1.5]MEU SANTO PTERODÁCTILO[/shake]", 
	"Isso foi uma...[delay, 160] flecha?",
	"Isso não faz nem sentido",//15
	"Ok[delay, 160], chega[delay, 160], me tira daqui logo",
	
	//Walk to edge, rex attack
	
	"[speed, 0.25]...[jitter]Mãe?[/jitter]...",
	"...Acho que ela não consegue sentir meu cheiro...", 
	"..Você fede muito...",
	"...",//20
	"[speed, 1.2]...Paia isso ai.",
	
	//Rex scream, rocks falling
	
	"!!", 
	"[shake]CORRE MERMÃO[/shake]"//23
	]

	//Unskippables
	unskippable_texts = [17, 22]

	//Cases
	enum TUT_STATE 
	{
	NONE,
	DROP_EGG,
	WALK,
	ROCK,
	ARROW,
	MID_EDGE,
	END_SCREAM,
	ENDEDGE,
	CAN_START
	}
	current_wait_state = TUT_STATE.NONE;
	draw_tip = "";
	
//Text variables
	txt_index = 0;
	drawn = 0;
	t = 150;
	at_crossroads = false;
	typist = scribble_typist();
	typist.in(0.5, 0.3);
	typist.sound(snd_typeegg, 20, 0.8, 1.2, 1)