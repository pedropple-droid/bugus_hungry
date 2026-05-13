// Create the final interactive object
	instance_create_layer(x, y, "Instances", target_item.obj);

// Clean up the sequence
	if (layer_sequence_exists("Instances", falling_seq)) 
	{
	    layer_sequence_destroy(falling_seq);
	};

// Self-destruct: this manager's job is done
	instance_destroy();