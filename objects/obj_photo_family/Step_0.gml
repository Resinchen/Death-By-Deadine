
/// Изменение фотографии семьи

if (obj_flags.fl_get_photos && obj_flags.fl_final_alive && obj_flags.fl_sending_files)
{
	// Семья + Жив + Работа
	photo_family_state = spr_photo_family_111;

}
else if (!obj_flags.fl_get_photos && obj_flags.fl_final_alive && obj_flags.fl_sending_files)
{
	// Жив + Работа
	photo_family_state = spr_photo_family_011;

}
else if (obj_flags.fl_get_photos && !obj_flags.fl_final_alive && obj_flags.fl_sending_files)
{
	// Семья + Работа
	photo_family_state = spr_photo_family_101;

}
else if (obj_flags.fl_get_photos && obj_flags.fl_final_alive && !obj_flags.fl_sending_files)
{
	// Семья + Жив
	photo_family_state = spr_photo_family_110;

}
else if (!obj_flags.fl_get_photos && !obj_flags.fl_final_alive && obj_flags.fl_sending_files)
{
	// Работа
	photo_family_state = spr_photo_family_001;

}
else if (!obj_flags.fl_get_photos && obj_flags.fl_final_alive && !obj_flags.fl_sending_files)
{
	// Жив
	photo_family_state = spr_photo_family_010;

}
else if (obj_flags.fl_get_photos && !obj_flags.fl_final_alive && !obj_flags.fl_sending_files)
{
	// Семья
	photo_family_state = spr_photo_family_100;

}
else if (!obj_flags.fl_get_photos && !obj_flags.fl_final_alive && !obj_flags.fl_sending_files)
{
	// Ничего (сгоревшая фотография)
	photo_family_state = spr_photo_family_000;
}
else
{
	photo_family_state = spr_photo_family_clear;  // Дефолтная фотография
}