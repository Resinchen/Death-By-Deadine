var xTo, yTo;
move_towards_point(mouse_x, mouse_y, 0);

xTo = obj_cs_player.x + lengthdir_x(min(96, distance_to_point(mouse_x, mouse_y)), direction);
yTo = obj_cs_player.y + lengthdir_y(min(96, distance_to_point(mouse_x, mouse_y)), direction);

x += (xTo - x)/ 25;
y += (yTo - y)/ 25;

xView = -(wView/2) + x;
yView = -(hView/2) + y;

xView = clamp(xView, 0, room_width-wView);
yView = clamp(yView, 0, room_height-hView);

camera_set_view_pos(view_camera[0], xView, yView);