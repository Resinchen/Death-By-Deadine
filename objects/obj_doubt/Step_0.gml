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
					var xx = x + lengthdir_x(30*2, direction);
					var yy = y + lengthdir_y(30*2, direction);
					if (!place_meeting(xx, yy, obj_solid)) break;
				}
				image_angle = direction-90;
				speed = 2;
				sprite_index = spr_doubt_walk;
			}
			else
			{
				speed = 0;
				sprite_index = spr_doubt_idle;
			}
			timerIdle = 30;
		}
		else
		{
			if (snd_move != noone && !audio_is_playing(snd_move)) snd_move = audio_play_sound(sound_monster_step1, 2, false);
			--timerIdle;
			sprite_index = spr_doubt_walk;
		}
		
		if (distance_to_object(obj_player) < 4*32 + obj_player.flashlight*2*32)
		{
			speed = 0;
			state = State.Running;
			sprite_index = spr_doubt_walk;
		}
		
		if (instance_exists(obj_flashlight) && point_direction(obj_player.x, obj_player.y, x, y)-90-obj_player.heroAngle > -15 && point_direction(obj_player.x, obj_player.y, x, y)-90-obj_player.heroAngle < 15 && distance_to_object(obj_player) < 11*32)
		{
			speed = 0;
			state = State.Running;
			sprite_index = spr_doubt_walk;
		}
		break;
	
	case State.Running:
		image_angle = point_direction(x, y, obj_player.x, obj_player.y)-90;
		if (distance_to_object(obj_player) < 4)
		{
			if (!obj_player.fl_captured)
			{
				speed = 0;
				state = State.Attacking;
				mem_x = obj_player.x;
				mem_y = obj_player.y;
			}
			else state = State.Idle;
		}
		else
		{
			if (snd_move != noone && !audio_is_playing(snd_move)) snd_move = audio_play_sound(sound_monster_step1, 2, false);
			move_towards_point(obj_player.x, obj_player.y, moveSpeed);
			sprite_index = spr_doubt_attack;
		}
		break;
	
	case State.Damaged:
		if (!audio_is_playing(sound_wet_hit)) audio_play_sound(sound_wet_hit, 2, false);
		sprite_index = spr_doubt_damage;
		speed = 0;
		if (timerDamage == 0)
		{
			state = State.Idle;
			instance_create_layer(x,y, "Instances", obj_blood);
			timerDamage = room_speed/2;
		}
		else --timerDamage;
		break;
		
	case State.Attacking:
		if (snd_move != noone)
    {
      audio_stop_sound(snd_move);
      snd_move = noone;
    }
		sprite_index = spr_doubt_catch_attack;
		obj_player.x = mem_x;
		obj_player.y = mem_y;
		if (timerAttack == 0)
		{
			obj_player.hp -= 3;
			if (obj_player.hp > 0) obj_player.state = PlayerState.Damaged;

			timerAttack = 1*room_speed;
		}
		else --timerAttack;
		break;
}

if (hp <= 0)
{	
	if (snd_move != noone)
    {
      audio_stop_sound(snd_move);
      snd_move = noone;
    }
	d = instance_create_depth(x, y, 0, obj_doubt_dead);
	d.image_angle = image_angle;
	instance_destroy();
}