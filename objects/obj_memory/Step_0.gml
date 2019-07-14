switch(state)
{
	case State.Idle:
		image_speed = 1;
		if (timerIdle == 0)
		{
			if (speed == 0)
			{
				while (true)
				{
					direction = random(360);
					var xx = x + lengthdir_x(30*2, direction);
					var yy = y + lengthdir_y(30*2, direction);
					if (!place_meeting(xx, yy, obj_solid)) break;
				}
				image_angle = direction-90;
				speed = 2;
				sprite_index = spr_memory_walk;
			}
			else
			{
				speed = 0;
				sprite_index = spr_memory_idle;
			}
			timerIdle = 30;
		}
		else --timerIdle;
		
		if (distance_to_object(obj_player) < 4*32 + obj_player.flashlight*2*32)
		{
			speed = 0;
			state = State.Running;
			sprite_index = spr_memory_walk;
		}
		
		if (instance_exists(obj_flashlight) && point_direction(obj_player.x, obj_player.y, x, y)-90-obj_player.heroAngle > -15 && point_direction(obj_player.x, obj_player.y, x, y)-90-obj_player.heroAngle < 15 && distance_to_object(obj_player) < 11*32)
		{
			speed = 0;
			state = State.Running;
			sprite_index = spr_memory_walk;
		}
		break;
	
	case State.Running:
		image_angle = point_direction(x, y, obj_player.x, obj_player.y)-90;
		if (distance_to_object(obj_player) < 8)
		{
			speed = 0;
			state = State.Attacking;
			sprite_index = spr_memory_attack;
		}
		else
		{
			move_towards_point(obj_player.x, obj_player.y, moveSpeed);
		}
		break;
		
	case State.Attacking:
		//audio_stop_sound(sound_monster_step1);
		if (timerAttack == 0)
		{
			obj_player.hp -= 1;
			if (obj_player.hp > 0) obj_player.state = PlayerState.Damaged;
			timerAttack = 1*room_speed;
		}
		else --timerAttack;
		
		if (distance_to_object(obj_player) >= 8)
		{
			state = State.Running;
			sprite_index = spr_memory_walk;
		}
		break;
	
	case State.Damaged:
		if (!audio_is_playing(sound_hurt)) audio_play_sound(sound_hurt, 2, false);
		sprite_index = spr_memory_damage;
		speed = 0;
		if (timerDamage == 0)
		{
			state = State.Idle;
			timerDamage = room_speed/2;
		}
		else --timerDamage;
		break;
	
	case State.Dead:
		if (timerDead == 0)
		{
			state = State.Rebirth;
			timerDead = 7*room_speed;
			hp = 3;
			speed = 0;
			timerIdle = 15;
			sprite_index = spr_memory_rebirth;
			image_index = 0;
		} 
		else --timerDead;
		break;
	
	case State.Rebirth:
		if (timerRebirth == 0)
		{	
			speed = 2;
			state = State.Idle;
			timerRebirth = 2*room_speed;
			sprite_index = spr_memory_idle;
		} 
		else --timerRebirth;
		break;
}

if (hp <= 0)
{
	sprite_index = spr_memory_dead;
	speed = 0;
	state = State.Dead;
}