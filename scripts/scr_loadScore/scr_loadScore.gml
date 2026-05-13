function scr_loadScore()
{
	//Check if any score is avaiable
	if file_exists("savefile.dat")
	{
		//Variable for creation of buffer
		var buffer = buffer_load("savefile.dat")
		
		//Seeks buffer, as is avaiable
		buffer_seek(buffer, buffer_seek_start, 0);
		
		//Adapts variables through score
		global.overall_score = buffer_read(buffer, buffer_f32);
		
		//Deletes buffer
		buffer_delete(buffer);
	};
};