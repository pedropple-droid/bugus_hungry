 if sprite_index == sprt_death
{
	image_index = 7
	global.game_over = true
	if global.player_score > global.overall_score
	{
		global.overall_score = global.player_score
	};
	scr_saveScore()
	exit
};

