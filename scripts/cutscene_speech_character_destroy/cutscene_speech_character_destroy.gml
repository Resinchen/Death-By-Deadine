/// @description cutscene_speech_character_destroy
/// @arg obj

/*
with (argument0)
{
	instance_destroy();
}
*/

if (!instance_exists(argument0))
	cutscene_end_action();