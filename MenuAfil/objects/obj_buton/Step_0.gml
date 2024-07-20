if (global.actual_screen = screen)
{
	active = true;
	image_alpha = 1;
	image_index = isSelected ? 1 : 0;

	var _mouse_x = device_mouse_x_to_gui(0)
	var _mouse_y = device_mouse_y_to_gui(0)
	if ((mouse_check_button_released(mb_left) && collision_point(_mouse_x, _mouse_y,self,0,0)) || keyboard_check_pressed(vk_enter)){
		if (isSelected){
			scr_execute_button_function(functionButton);
			scr_use_sound(soundClicked);
		}	
	}
}
else {
	active = false;
	image_alpha = 0.3;
}