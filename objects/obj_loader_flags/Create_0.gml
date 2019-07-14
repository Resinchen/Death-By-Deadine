fname = "flags.ini"

if(!file_exists(fname)) {
	ini_open(fname)
	
	ini_write_real("Flags", "fl_note_back_exit", false)  // item
	ini_write_real("Flags", "fl_note_back_exit_door",false)  // item
	ini_write_real("Flags", "fl_get_107_key", false)  // item
	ini_write_real("Flags", "fl_get_smokeroom_key", false)  // item
	
	ini_write_real("Flags", "fl_get_mouse_cafe", false)  // item
	ini_write_real("Flags", "fl_get_keyboard_cafe", false)  // item
	ini_write_real("Flags", "fl_write_phone_number", false)
	ini_write_real("Flags", "fl_sending_files", false)

	ini_write_real("Flags", "fl_listen_hospital_generator", false)
	
	ini_write_real("Flags", "fl_call_copycenter", false)
	ini_write_real("Flags", "fl_get_photos", false)  // item
	
	ini_write_real("Flags", "fl_find_hospital_map", false)  // item
	ini_write_real("Flags", "fl_get_defibrillator", false)  // item
	ini_write_real("Flags", "fl_final_alive", true)  // item

	ini_close()
}