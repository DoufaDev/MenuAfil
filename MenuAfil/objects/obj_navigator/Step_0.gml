var _key_down = vk_down;
var _key_up = vk_up;

var _list_size = ds_list_size(navigator_list);
var _last_index = _list_size - 1;

if (keyboard_check_pressed(_key_down)){
	if (navigator_index == _last_index){
		navigator_index = 0;
		while (navigator_list[|navigator_index].active == false){
			navigator_index++;
		}
	} else {
		var _first_index;
		for (var i = 0; i < _list_size; i++){
			if (navigator_list[|i].active == true){
				_first_index = i;
				break;
			}
		}
		if (navigator_index < _first_index){
			navigator_index = _first_index;
		} else {
			navigator_index++;
		}
	}
	scr_use_sound(sound)
}
if (keyboard_check_pressed(_key_up)){
	var _first_index;
	for (var i = 0; i < _list_size; i++){
		if (navigator_list[|i].active == true){
			_first_index = i;
			break;
		}
	}
	if (navigator_index <= _first_index){
		navigator_index = _last_index;
	}else {
		navigator_index--;
	}
	scr_use_sound(sound)
}



for (var i = 0; i < _list_size; i++){
	if (i == navigator_index){
		navigator_list[|i].isSelected = true;
	} else {
		navigator_list[|i].isSelected = false;
	}
}