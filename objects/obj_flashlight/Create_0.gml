depth = -5;

x = obj_player.x;
y = obj_player.y;
view_x = camera_get_view_x(view_camera);
view_y = camera_get_view_y(view_camera) ;

dark = surface_create(room_width, room_height);
surface_set_target(dark);
draw_clear_alpha(c_black, 1);
surface_reset_target();
