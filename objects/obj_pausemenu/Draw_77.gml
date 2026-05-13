//Disable alpha blending
	gpu_set_blendenable(false)
	
//If paused, draw frozen image on screen
	if (global.pause)
	{
		surface_set_target(application_surface);
			if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0, 0);
			else 
			{
				pauseSurf = surface_create(resW, resH);
				buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
			}
		surface_reset_target();
	}

	if (keyboard_check_pressed(vk_escape))
	{
		if (!global.pause)
		{
			global.pause = true;
			fmenu = true;
			instance_deactivate_all(true)
			
			pauseSurf = surface_create(resH, resW);
			surface_set_target(pauseSurf);
			draw_surface(application_surface, 0, 0);
			surface_reset_target();
			
			if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
			pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
			buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
		}
		else if (fmenu)
		{
			global.pause = false;
			fmenu = false;
			instance_activate_all();
			if (surface_exists(pauseSurf)) surface_free(pauseSurf);
			if (surface_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		}
		
		else if (setting)
		{
			setting = false
			fmenu = true
		}
		
		else if (keybind)
		{
			keybind = false
			setting = true
		}
	};
	
	//Enable alpha blending
	gpu_set_blendenable(true)