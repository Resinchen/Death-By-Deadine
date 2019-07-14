if (global.is_exit_out_menu)
{ 
	player_x = xstart;
	player_y = ystart;
	global.is_exit_out_menu = false;
}

if(room == room_koridor1 && has_pipe = false)
{
	scr_show_dialog("Андрей", "Кажется, я забыл что-то в гардеробе.");
}

x = player_x;
y = player_y;

if(flashlight)
{
	instance_destroy(obj_flashlight);
	instance_destroy(obj_dark);
	instance_create_depth(0,0,0, obj_flashlight);
}
if (room == room_lift || room == room_final)
{
	if (flashlight) with (obj_flashlight) instance_destroy();
	instance_destroy();
}
	