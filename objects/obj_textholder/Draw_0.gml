//Tutorial sequence
	//Variables
	var _current_text = scribble(pt_intro_texts[txt_index])
	.starting_format("f_skip", c_white)
	.blend(c_white, 1)
	.wrap(424, 128)
	.align(fa_center, fa_middle);
	var _width = _current_text.get_width() + 24
	var _height = _current_text.get_height() + 24
	var _textbox = sprt_9patch_intro;

	//Text box
	if layer_exists("intro_box")
	{
		layer_destroy("intro_box");
	};
	
	if (!layer_exists("intro_box")) 
	{
		layer_create(201, "intro_box")
	};	
	
	_textboxID = draw_sprite_stretched(_textbox, 1, x - _width / 2, y - _height / 2, _width, _height)
	
	//Text
	draw_set_halign(fa_center)
	_current_text.draw(x, y);
	
	//typewriter
	var typist = scribble_typist();
	typist.in(1, 0.1)
	