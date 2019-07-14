surface_set_target(dark);
draw_clear_alpha(c_black, 0.85);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_light, 0, x-view_x, y-view_y, 1, 1, obj_player.heroAngle+90, c_white, 1);
gpu_set_blendmode(bm_normal);
surface_reset_target();