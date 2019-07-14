if (file_exists(fname)) {
	ini_open(fname)
	
	ini_write_real("Flags", "fl_note_back_exit", fl_note_back_exit)
	ini_write_real("Flags", "fl_note_back_exit_door",fl_note_back_exit_door)
	ini_write_real("Flags", "fl_get_107_key", fl_get_107_key)
	ini_write_real("Flags", "fl_get_smokeroom_key", fl_get_smokeroom_key)
	
	ini_write_real("Flags", "fl_get_mouse_cafe", fl_get_mouse_cafe)
	ini_write_real("Flags", "fl_get_keyboard_cafe", fl_get_keyboard_cafe)
	ini_write_real("Flags", "fl_write_phone_number", fl_write_phone_number)
	ini_write_real("Flags", "fl_sending_files", fl_sending_files)

	ini_write_real("Flags", "fl_listen_hospital_generator", fl_listen_hospital_generator)
	
	ini_write_real("Flags", "fl_call_copycenter", fl_call_copycenter)
	ini_write_real("Flags", "fl_get_photos", fl_get_photos)
	
	ini_write_real("Flags", "fl_find_hospital_map", fl_find_hospital_map)
	ini_write_real("Flags", "fl_get_defibrillator", fl_get_defibrillator)
	ini_write_real("Flags", "fl_final_alive", fl_final_alive)

	ini_close()
}