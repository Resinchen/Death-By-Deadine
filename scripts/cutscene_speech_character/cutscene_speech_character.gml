/// @description cutscene_speech_character
/// @arg name
/// @arg text

var inst = instance_create_layer(0, 0, "Instances", obj_textBox);

with (inst)
{
	name = argument0;
	text = argument1;
}

cutscene_end_action();

return inst;