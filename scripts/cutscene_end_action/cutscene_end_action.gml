/// @description cutscene_end_action

scene++;

if (scene > array_length_1d(scene_info) - 1)
{
	instance_destroy();
	room_goto(room_first_office); // тут можно как-нибудь пошаманить, если будет > 1 катсцены
}