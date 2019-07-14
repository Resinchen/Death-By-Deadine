/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case State.Idle:
		if (timerIdle == 0)
		{
			++hp;
			hp = min(4, hp);
			timerIdle = 30;
		}
		else --timerIdle;
		
		if (obj_player.flashlight)
		{
			var xx = obj_player.x + lengthdir_x(32*10, obj_player.heroAngle+90);
			var yy = obj_player.y + lengthdir_y(32*10, obj_player.heroAngle+90);
			if (distance_to_point(xx, yy) > 3*32)
			{
				if (!audio_is_playing(sound_monster_step2)) audio_play_sound(sound_monster_step2, 2, false);
				move_towards_point(xx, yy, 2);
				image_angle = direction-90;
				sprite_index = spr_curiosity_walk;
			}
			else if (point_direction(obj_player.x, obj_player.y, x, y)-90-obj_player.heroAngle > -15 && point_direction(obj_player.x, obj_player.y, x, y)-90-obj_player.heroAngle < 15)
			{
				if (runTimer == 0)
				{
					while (true)
					{
						direction = random(360);
						var xxx = x + lengthdir_x(20*3, direction);
						var yyy = y + lengthdir_y(20*3, direction);
						if (!place_meeting(xxx, yyy, obj_solid)) break;
					}
					speed = 3;
					sprite_index = spr_curiosity_fears;
					runTimer = 20;
				}
				else --runTimer;
			}
			else
			{
				speed = 0;
				sprite_index = spr_curiosity_idle;
			}
		}
		else
		{
			speed = 0;
			sprite_index = spr_curiosity_idle;
		}
		
		break;
	
	case State.Damaged:
		if (!audio_is_playing(sound_wet_hit) && fl_sound_damage) 
		{
			fl_sound_damage = false;
			audio_play_sound(sound_wet_hit, 2, false);
		}
		sprite_index = spr_curiosity_idle;
		speed = 0;
		hp = max(0, hp);
		if (timerDamage == 0)
		{
			fl_sound_damage = true;
			state = State.Idle;
			timerDamage = room_speed;
		}
		else --timerDamage;
		break;
}

image_alpha = hp/4;