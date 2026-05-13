//Variables
	var seq_done = layer_sequence_is_finished(current_seq)
	var seq_skip = keyboard_check_pressed(global.key_escape) || keyboard_check_pressed(global.key_select)
	var debug_skip = keyboard_check_pressed(vk_f4)

//Check for done or skip
	if (debug_skip) room_goto(rm_game)
	if (seq_done || seq_skip)
	{
		if (txt_index < array_length(en_intro_texts) - 1) 
		{
        txt_index++;
		}
		else
		{
		room_goto(rm_game)
		}
		
		if (txt_index == 3) target_seq = 1;
		if (txt_index == 6) target_seq = 2;
		if (txt_index == 19) target_seq = 3;
		if (txt_index == 38) target_seq = 4;
		
		if (target_seq != seq_index) 
		{
			seq_index = target_seq;
			layer_sequence_destroy(current_seq);
			current_seq = layer_sequence_create("Instances", x, y, seq_intros[seq_index])
		};
	};
	
	