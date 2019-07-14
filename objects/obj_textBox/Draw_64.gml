draw_set_color(c_white);
draw_rectangle(xOrigin, yOrigin, xOrigin + width, yOrigin + height, false);

draw_set_color(c_black);
draw_rectangle(innerBox_xOrigin, innerBox_yOrigin, innerBox_xOrigin + innerBoxWidth, innerBox_yOrigin + innerBoxHeight, false);

draw_set_color(c_white);
draw_set_font(f_name);
draw_text(name_xOrigin, name_yOrigin, name);
draw_set_font(f_speech)
draw_text_ext(text_xOrigin, text_yOrigin, text, 25, innerBoxWidth-100);

draw_text(tips_xOrigin, tips_yOrigin, "<Space> to continue");

