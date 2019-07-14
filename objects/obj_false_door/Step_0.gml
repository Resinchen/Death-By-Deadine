dir = point_direction(x, y, obj_player.x, obj_player.y);

detect_angle = 30;

if (obj_player.flashlight && abs(angle_difference(obj_player.heroAngle-90, dir)-3) < detect_angle
	&& distance_to_object(obj_player) < 300 || 
obj_player.flashlight && distance_to_object(obj_player) < 30)
{
	active = false;
	sprite_index = spr_false_door;
}
else
{
	active = true;
	sprite_index = spr_door;
}
