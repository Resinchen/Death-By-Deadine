/// @description cutscene_move_character_to
/// @arg x
/// @arg y
/// @arg obj
/// @arg relative?
/// @arg speed

var obj = argument2, relative = argument3, spd = argument4;

if (x_dest == -1)
{
	if (!relative)
	{
		x_dest = argument0;
		y_dest = argument1;
	}
	else
	{
		x_dest = obj.x + argument0;
		y_dest = obj.y + argument1;	
	}
}

var xx = x_dest;
var yy = y_dest;

with (obj)
{
	//sprite_index = sprite_walk;
	if (point_distance(x, y, xx, yy) >= spd)
	{
		var dir = point_direction(x, y, xx, yy);
	
		var ldirx = lengthdir_x(spd, dir);
		var ldiry = lengthdir_y(spd, dir);

		image_angle = dir - 90;

		x += ldirx;
		y += ldiry;
	}
	else
	{
		//sprite_index = sprite_idle;
		x = xx;
		y = yy;
		
		with (other)
		{
			x_dest = -1;
			y_dest = -1;
			cutscene_end_action();
		}
	}
}
