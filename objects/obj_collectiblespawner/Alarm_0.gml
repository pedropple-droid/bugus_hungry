//Destroy the shadow
	if (layer_sequence_exists("Instances", shadow_seq)) 
	{
	    layer_sequence_destroy(shadow_seq);
	};

//Create the falling sequence based on the struct data
	falling_seq = layer_sequence_create("Instances", x, y, target_item.seq_fall);

//Set timer for the actual object to appear
	alarm[1] = 45;