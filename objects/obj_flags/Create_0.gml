cursor_sprite = spr_game_cursor;

fname = "flags.ini";

if(!file_exists(fname))
{
	ini_open(fname);
	
	ini_write_real("Flags", "fl_note_back_exit", false);  // item
	ini_write_real("Flags", "fl_note_back_exit_door",false);  // item
	ini_write_real("Flags", "fl_get_107_key", false);  // item
	ini_write_real("Flags", "fl_get_smokeroom_key", false);  // item
	
	ini_write_real("Flags", "fl_get_mouse_cafe", false);  // item
	ini_write_real("Flags", "fl_get_keyboard_cafe", false);  // item
	ini_write_real("Flags", "fl_write_phone_number", false);
	ini_write_real("Flags", "fl_sending_files", false);

	ini_write_real("Flags", "fl_listen_hospital_generator", false);
	
	ini_write_real("Flags", "fl_call_copycenter", false);
	ini_write_real("Flags", "fl_get_photos", false);  // item
	
	ini_write_real("Flags", "fl_find_hospital_map", false);  // item
	ini_write_real("Flags", "fl_get_defibrillator", false);  // item
	ini_write_real("Flags", "fl_final_alive", true);  // item

	ini_close();
	
	fl_note_back_exit = false;
	fl_note_back_exit_door = false;
	fl_get_107_key = false;
	fl_get_smokeroom_key = false;

	fl_get_mouse_cafe = false;
	fl_get_keyboard_cafe = false;
	fl_write_phone_number = false;
	fl_sending_files = false;

	fl_listen_hospital_generator = false;

	fl_call_copycenter = false;
	fl_get_photos = false;

	fl_find_hospital_map = false;
	fl_get_defibrillator = false;
	fl_final_alive = true;
}
else
{
	ini_open(fname);
	
	fl_note_back_exit = bool(ini_read_real("Flags", "fl_note_back_exit", 0));  // Взяли записку про эвакуационного выхода
	fl_note_back_exit_door = bool(ini_read_real("Flags", "fl_note_back_exit_door", 0));  // Взяли записку с двери про эвакуационного выхода
	fl_get_107_key = bool(ini_read_real("Flags", "fl_get_107_key", 0));  // Получен ключ от 107 комнаты
	fl_get_smokeroom_key = bool(ini_read_real("Flags", "fl_get_smokeroom_key", 0));  // Получен ключ от курилки

	fl_get_mouse_cafe = bool(ini_read_real("Flags", "fl_get_mouse_cafe", 0));  // Взяли мышку для интернет-кафе
	fl_get_keyboard_cafe = bool(ini_read_real("Flags", "fl_get_keyboard_cafe", 0));  // Взяли клавиатуру для интернет-кафе
	fl_write_phone_number = bool(ini_read_real("Flags", "fl_write_phone_number", 0));  // Записали номер из email
	fl_sending_files = bool(ini_read_real("Flags", "fl_sending_files", 0));  // Отправил файлы
	
	fl_listen_hospital_generator = bool(ini_read_real("Flags", "fl_listen_hospital_generator", 0));  // Услышали про генератор в больнице

	fl_call_copycenter = bool(ini_read_real("Flags", "fl_call_copycenter", 0));  // Позвонили в копицентр
	fl_get_photos = bool(ini_read_real("Flags", "fl_get_photos", 0));  // Забрали фотографии из копицентра

	fl_find_hospital_map = bool(ini_read_real("Flags", "fl_find_hospital_map", 0));  // Нашли карту госпиталя
	fl_get_defibrillator = bool(ini_read_real("Flags", "fl_get_defibrillator", 0));  // Взяли дефибриллятор
	fl_final_alive = bool(ini_read_real("Flags", "fl_final_alive", 0));  // Выжил в конце

	ini_close();
}