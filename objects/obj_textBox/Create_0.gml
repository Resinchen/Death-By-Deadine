text = "";
name = "";

padding = 50;
width = camera_get_view_width(view_camera[0]) - padding;
height = 200;

// Outer Box
xOrigin = padding;
yOrigin = camera_get_view_height(view_camera[0]) - height;


// Inner Box
borderSize = 20;
innerBoxWidth = width - borderSize;
innerBoxHeight = height - borderSize;
innerBox_xOrigin = xOrigin + (borderSize/2);
innerBox_yOrigin = yOrigin + (borderSize/2);


// Dialog display
name_xOrigin = innerBox_xOrigin + 100;
name_yOrigin = innerBox_yOrigin + 10;
text_xOrigin = innerBox_xOrigin + 50;
text_yOrigin = innerBox_yOrigin + 55;
tips_xOrigin = innerBox_xOrigin + innerBoxWidth - 170;
tips_yOrigin = innerBox_yOrigin + innerBoxHeight - 25;
