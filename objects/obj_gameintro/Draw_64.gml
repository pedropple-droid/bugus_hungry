//Draw skip intro
	draw_set_font(f_skip)

	scribble("[f_skip][wave]Press Space Bar to skip intro[wave]").blend(c_white, 1).draw(500, 680);

// 1. Set text alignment (centered makes intros look cleaner)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

// 3. Draw the actual text
// We use txt_index to pull the correct string from your array
	var _current_text = en_intro_texts[txt_index];
	var _screen_x = (display_get_gui_width() / 2) - 400;
	var _screen_y = display_get_gui_height() - 500;

	scribble(_current_text).blend(c_white, 1).draw(_screen_x, _screen_y)

// 4. Reset alignment so other objects don't get messed up
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);