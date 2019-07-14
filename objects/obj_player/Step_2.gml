if (hp <= 0)
{	
	moveSpeed = 0;
	cur_sprite = sprite_dead;
}

if (state == PlayerState.Dead && floor(frame) >= sprite_get_number(cur_sprite))
{
	audio_play_sound(sound_die, 2, false);
	frameSpeed = 0;
	frame = sprite_get_number(cur_sprite)-1;
	alarm[1] = 3*room_speed;
}

if (state == PlayerState.Attacking && floor(frame) >= sprite_get_number(cur_sprite)) state = PlayerState.Targeting;


if (floor(frame) >= sprite_get_number(cur_sprite)) frame = 0;
