function scr_IngameCamera()
{
//Initializing Viewports
	view_enabled = true;
	view_visible[0] = true;
	
	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = 1280;
	view_hport[0] = 720;
	
	//Setting Viewports
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth / 6);
	var _ypos = (_dheight / 6);
	window_set_rectangle(_xpos, _ypos, 1280, 720);
	surface_resize(application_surface, 1280, 720)
	
	//Initializing Camera
	view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_bugu, -1, -1, -1, -1);
}