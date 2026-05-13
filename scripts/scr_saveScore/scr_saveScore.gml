function scr_saveScore(){
	//Variable for creation of buffer
	var buffer = buffer_create(1024, buffer_grow, 1);
	
	//Creation of buffer
	buffer_write(buffer, buffer_f32, global.overall_score);
	
	//Save the buffer
	buffer_save(buffer, "savefile.dat");
	
	//Deletion of buffer
	buffer_delete(buffer)
}