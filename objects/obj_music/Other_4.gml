/// @description Insert description here
// You can write your code in this editor
if (room != room_menu)
{
	audio_stop_sound(sound_menu);
	/*
	var rand = irandom(1);
	switch (rand)
	{
		case 0:
			if (!audio_is_playing(sound_office))
			{
				audio_stop_sound(sound_theme);
				audio_play_sound(sound_office, 1, true);
			}
			break;
	
		case 1:
			if (!audio_is_playing(sound_theme))
			{
				audio_stop_sound(sound_office);
				audio_play_sound(sound_theme, 1, true);
			}
			break;
	}
	*/
	if (room == room_lift || room == room_final)
	{
		audio_stop_all();
	}
	else if (room == room_first_office || room == room_koridor1 || room == room_electroshit || room == room_garderob)
	{
		if (!audio_is_playing(sound_office))
			{
				audio_stop_sound(sound_theme);
				audio_play_sound(sound_office, 1, true);
			}
	}
	else
	{
		if (!audio_is_playing(sound_theme))
			{
				audio_stop_sound(sound_office);
				audio_play_sound(sound_theme, 1, true);
			}
	}
}
else
{
	audio_stop_all();
	audio_play_sound(sound_menu, 1, true);
}