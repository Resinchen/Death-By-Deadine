dir = point_direction(x, y, obj_player.x, obj_player.y);

detect_angle = (obj_player.flashlight ? 20 : 10);  // Половина угла обнаружения

if (abs(angle_difference(obj_player.heroAngle-90, dir)-3) < detect_angle
	&& distance_to_object(obj_player) < 200 
	&& !collision_line(x, y, obj_player.x, obj_player.y, obj_solid, false, false))
{
	sprite_index = selected_sprite;
}
else
{
	sprite_index = passive_sprite;
}
