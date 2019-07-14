switch(state)
{
	case State.Idle:
		if (timerIdle == 0)
		{
			if (speed == 0)
			{
				while (true)
				{
					direction = random(360);
					var xx = x + lengthdir_x(30*1, direction);
					var yy = y + lengthdir_y(30*1, direction);
					if (!place_meeting(xx, yy, obj_solid)) break;
				}
				image_angle = direction-90;
				speed = 1;
				sprite_index = spr_indifference_walk;
			}
			else
			{
				speed = 0;
				sprite_index = spr_indifference_idle;
			}
			timerIdle = 30;
		}
		else --timerIdle;
		
		if (place_meeting(x, y, obj_player))
		{
			state = State.Attacking;
			timerAttack = 0;
		}
		break;
		
	case State.Attacking:
		if (timerAttack == 0)
		{
			obj_player.hp -= 20;
			if (obj_player.hp > 0) obj_player.state = PlayerState.Damaged;
			timerAttack = 1*room_speed;
		}
		else --timerAttack;
		
		if (!place_meeting(x, y, obj_player))
		{
			state = State.Idle;	
		}
		break;
	
	case State.Damaged:
		sprite_index = spr_indifference_idle;
		speed = 0;
		if (timerDamage == 0)
		{
			state = State.Idle;
			timerDamage = room_speed/2;
			hp = -1;
		}
		else --timerDamage;
		break;
}

audio_sound_gain(aud, 1/(sqrt((obj_player.x - x)*(obj_player.x - x) + (obj_player.y - y)*(obj_player.y - y))/sqrt(room_width*room_width + room_height*room_height)*2), 0);
