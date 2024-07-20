//Variables
isSelected = false;
active = true;

//Initializing
image_speed = 0;
image_index = 0;

var _x = display_get_gui_width()/2;
var _y = display_get_gui_width()/2;


if (!instance_exists(obj_navigator)){
	instance_create_layer( _x, _y,"Controllers",obj_navigator);
}
ds_list_add(obj_navigator.navigator_list, self.id);

soundSelected = snd_button_selected;
soundClicked = snd_button_clicked;