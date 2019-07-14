hp = -1;

timerIdle = 30;
timerAttack = 0;
timerDamage = room_speed/2;

state = State.Idle;
sprite_index = spr_indifference_idle;

aud = audio_play_sound(sound_indifference, 3, true);