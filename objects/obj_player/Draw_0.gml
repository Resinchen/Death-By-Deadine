switch(state)
{
	case PlayerState.Idle:
		cur_sprite = sprite_idle;
		break;
		
	case PlayerState.Walking:
		cur_sprite = sprite_walk;
		break;
		
	case PlayerState.Damaged:
		cur_sprite = sprite_damage;
		break;
		
	case PlayerState.Targeting:
		cur_sprite = sprite_targeting;
		break;
		
	case PlayerState.Attacking:
		cur_sprite = sprite_attack;
		break;
		
	case PlayerState.Dead:
		cur_sprite = sprite_dead;
		break;
}

draw_sprite_ext(cur_sprite, frame, x, y, 1, 1, heroAngle, c_white, 1);

if (mouse_check_button(mb_right))
{
	if (equip_weapon == "pistol") cursor_sprite = spr_cursor; //draw_sprite(spr_cursor, 0, mouse_x, mouse_y);
	else cursor_sprite = spr_game_cursor;
	if (equip_weapon == "pipe") draw_circle_color(x, y, 50, c_white, c_black, true);
}
else cursor_sprite = spr_game_cursor;