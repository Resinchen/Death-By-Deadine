/// @description create_cutscene
/// @arg scene_info

var inst = instance_create_layer(0, 0, "Instances", obj_cutscene);

with (inst)
{
	scene_info = argument0;
}