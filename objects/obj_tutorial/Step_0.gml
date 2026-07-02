// Follow egg
x = obj_egg.x;
y = obj_egg.y - 150;


//The Crossroads Brake (State Evaluation)
if (at_crossroads)
{
	var _condition_met = false;
	
	switch (current_wait_state)
	{
		case TUT_STATE.DROP_EGG:
			if (global.candropegg)
			{
				if (keyboard_check_pressed(global.drop_egg))
				{
					_condition_met = true;
				}
			}
		break;
		
		case TUT_STATE.WALK:
			if (global.canwalk && obj_bugu.hasEgg && !global.haswalked) 
			{
				global.haswalked = true;
				_condition_met = true;
			}
		break;
		
		case TUT_STATE.ROCK:
			if (global.rock) 
			{
				global.rock = false;
				_condition_met = true;
			}
		break;
		
		case TUT_STATE.ARROW:
			if (global.arrow) 
			{
				global.arrow = false;
				_condition_met = true;
			}
		break;
		
		case TUT_STATE.MID_EDGE:
			if (global.midedge && (keyboard_check_pressed(global.key_select) || keyboard_check_pressed(vk_enter))) 
			{
				global.canedge = false;
				global.midedge = false;
				_condition_met = true;
			}
		break;
		
		case TUT_STATE.END_SCREAM:
			if (global.endscream && !audio_is_playing(snd_rexy)) 
			{
				global.endedge = true;
				_condition_met = true;
			}
		break;
		
		case TUT_STATE.ENDEDGE:
			if (global.endedge) 
			{			
				global.endscream = false;
				_condition_met = true;
			}
		break;
		
		case TUT_STATE.CAN_START:
			if (global.canstart) 
			{
				global.endedge = false;
				global.learning = false;
				_condition_met = true;
			}
		break;
	}
	
	//If the player did the required action, unpause and advance text
	if (_condition_met) 
	{
		t = 0;
		at_crossroads = false;
		current_wait_state = TUT_STATE.NONE;
	}
	else 
	{
		exit; //Block frame progress until condition is hit
	}
}

//Intro Sequence (Text Advance Mechanics)
t--;
var _can_skip = !array_contains(unskippable_texts, txt_index);
var _expired_t = (t <= 0);
var _skip = _can_skip  && (keyboard_check_pressed(global.key_select) || keyboard_check_pressed(vk_enter));

if (_expired_t || _skip)
{
	if (typist.get_state() < 1)
	{
		typist.skip();
	}
	else if (txt_index < array_length(pt_intro_texts) - 1) 
	{
		txt_index++;
		t = 185;
	}
}

// 4. Event Triggers (Setting Up the Next State)
switch (txt_index)
{
	case 1:
		show_debug_message("CASE 1: Drop Egg Tutorial");
		global.candropegg = true;
		at_crossroads = true;
		current_wait_state = TUT_STATE.DROP_EGG;
		draw_tip = "Aperte " + key_to_string(global.drop_egg) + " para soltar o ovo. Te permite andar mais rápido"
	break;
	
	case 8:
		show_debug_message("CASE 8: Walk Tutorial");
		global.canwalk = true;
		at_crossroads = true;
		current_wait_state = TUT_STATE.WALK;
		draw_tip = "Aperte " + key_to_string(global.key_up) + ", " + key_to_string(global.key_left) + ", "  + key_to_string(global.key_down) + ", " + key_to_string(global.key_right) + " para poder e movimentar!"
	break;
	
	case 9:
		show_debug_message("CASE 9: Rock Spawn");
		if (!instance_exists(obj_tutrock)) {
			instance_create_layer(x, y, "Instances", obj_tutrock);
		}
		at_crossroads = true;
		current_wait_state = TUT_STATE.ROCK;
		draw_tip = "";
	break;
	
	case 12:
		show_debug_message("CASE 12: Warning Sign Spawn");
		if (!instance_exists(obj_warningsign)) {
			instance_create_layer(x, 628, "Instances", obj_warningsign);
		}
		at_crossroads = true;
		current_wait_state = TUT_STATE.ARROW;
		draw_tip = "";
	break;
	
	case 16:
		show_debug_message("CASE 16: Rex Edge Tutorial");
		if (!instance_exists(obj_tutrex)) {
			global.canedge = true;
			at_crossroads = true;
			current_wait_state = TUT_STATE.MID_EDGE;
			draw_tip = "Tente sair da caverna..."
		}
	break;
	
	case 22:
		show_debug_message("CASE 22: Rex Scream");
		if (!global.endscream) {
			sound_handlerFX(snd_rexy);
			global.endscream = true;
		}
		at_crossroads = true;
		current_wait_state = TUT_STATE.END_SCREAM;
		draw_tip = "";
	break;
	
	case 23:
		show_debug_message("CASE 23: Level Setup Handover");
		if (!global.canstart) {
			global.canstart = true;
			alarm[0] = 250;
		}
		at_crossroads = true;
		current_wait_state = TUT_STATE.CAN_START;
		draw_tip = "";
	break;
}