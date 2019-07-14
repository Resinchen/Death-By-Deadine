if (keyboard_check_pressed(vk_space))
{
	switch (cur) {
	case 0:
		y += 160;
		break;
	case 1:
		y += 224;
		break;
	case 2:		
		y += 192;
		break;
	case 3:		
		y += 1000;
		break;
	}
	cur+=1
}