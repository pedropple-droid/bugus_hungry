//Fixes the sign at the borders
	var cam = view_camera[0];
	var _cx = camera_get_view_x(cam);
	var _cw = camera_get_view_width(cam);
	var _margin = 128;

	if (my_side == "left") x = _cx + _margin; 
	else x = _cx + _cw - _margin;