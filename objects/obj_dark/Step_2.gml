surface_set_target(dark);
draw_clear_alpha(c_black, 0.9);
gpu_set_blendmode(bm_subtract);
gpu_set_blendmode(bm_normal);
surface_reset_target();