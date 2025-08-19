function scr_panicbg_end()
{
	//DDP This script is run after the last background element has been drawn
	if (event_type == ev_draw && event_number == 0)
	{
		// Set panic background shader and render to application_surface
	    surface_reset_target();
	    shader_set(shd_panicbg);
		
		// Set panic intensity in shader
	    var panic_id = shader_get_uniform(shd_panicbg, "panic");
	    shader_set_uniform_f(panic_id, global.wave / global.maxwave);
		
		// Set current time in shader
	    var time_id = shader_get_uniform(shd_panicbg, "time");
	    shader_set_uniform_f(time_id, current_time / 1000);
		
		// Draw panicbg_surface and reset to application surface
	    draw_surface(global.panicbg_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
	    shader_reset();
	}
}