enum Screens {
	MainMenu,
	Settings,
	Gameplay,
}

enum Functions{
	Play,
	Settings,
	Quit,
	Return,
	VolumeUp,
	VolumeDown,
	Fullscreen,
	Close,
}

global.actual_screen = Screens.MainMenu;
global.sound_volume = 1;

function scr_execute_button_function(){
	///@argument0 functionIndex
	var _functionIndex = argument[0];
	switch (_functionIndex){
		case Functions.Play:
			scr_button_play();
			break;
		case Functions.Settings:
			scr_button_settings();
			break;
		case Functions.Quit:
			scr_button_quit();
			break;
		case Functions.Return:
			scr_button_return();
			break;
		case Functions.VolumeUp:
			scr_button_volume_up();
			break;
			break;
		case Functions.VolumeDown:
			scr_button_volume_down();
			break;
		case Functions.Fullscreen:
			scr_button_fullscreen();
			break;
		case Functions.Close:
			scr_button_close("Settings");
			break;
	}
}


function scr_button_play(){
	///@arg ScreenIndex
	room_goto(rm_gameplay);
	global.actual_screen = Screens.Gameplay;
}

function scr_button_settings(){
	
	global.actual_screen = Screens.Settings;
	
	instance_create_layer(x + 250, y - 188, "Settings", obj_buton,
	{
	textButton : "Tela cheia",
	functionButton : Functions.Fullscreen,
	screen : Screens.Settings,
	});
	
	instance_create_layer(x + 250, y - 96, "Settings", obj_buton,
	{
	textButton : "Aumentar",
	functionButton : Functions.VolumeUp,
	screen : Screens.Settings,
	});
	
	instance_create_layer(x + 250, y + 96, "Settings", obj_buton,
	{
	textButton : "Diminuir",
	functionButton : Functions.VolumeDown,
	screen : Screens.Settings,
	});
	
	
	instance_create_layer(x + 250, y + 188, "Settings", obj_buton,
	{
	textButton : "Voltar",
	functionButton : Functions.Close,
	screen : Screens.Settings
	});
	
	
}

function scr_button_quit(){
	if (show_question("Deseja fechar o jogo?")){
		game_end();
	}
}

function scr_button_return(){
	global.actual_screen = Screens.MainMenu;
	room_goto(rm_menu);
}

function scr_button_volume_up() {
	global.sound_volume += 0.1;
	if (global.sound_volume >= 1){
		global.sound_volume = 1;
	}
	audio_set_master_gain(0,global.sound_volume)
}
function scr_button_volume_down() {
	global.sound_volume -= 0.1;
	if (global.sound_volume <= 0){
		global.sound_volume = 0;
	}
	audio_set_master_gain(0,global.sound_volume)
}

function scr_button_fullscreen(){
	window_set_fullscreen(!window_get_fullscreen())
	
}

function scr_button_close(){
	///@arg0 layer
	layer_destroy_instances(argument[0]);
	global.actual_screen = Screens.MainMenu;
	obj_navigator.navigator_index = -1;
}

