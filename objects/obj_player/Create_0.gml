#region Спрайты
sprite_idle = spr_player_shirt_idle;
sprite_walk = spr_player_shirt_walk;
sprite_damage = spr_player_shirt_idle;
sprite_targeting = spr_player_shirt_idle;
sprite_attack = spr_player_shirt_idle;
sprite_dead = spr_player_dead
#endregion

enum PlayerState
{
	Idle,
	Walking,
	Targeting,
	Damaged,
	Attacking,
	Dead
}

enum PlayerSprites
{
	Shirt,
	Jacket,
	Pipe,
	Pistol
}

#region Состояния
state = PlayerState.Idle;
sprite_pack = PlayerSprites.Shirt;
#endregion

#region
damageSound[0] = sound_hit1;
damageSound[1] = sound_hit2;
damageSound[2] = sound_hit3;
damageSound[3] = sound_hit4;
#endregion

#region Оружие при себе
has_pipe = false;
has_pistol = false;
#endregion

#region Движение и остальное
moveSpeed = 2;
hMove = 0;
vMove = 0;
hsp = 0;
vsp = 0;
cur_sprite = sprite_idle;
hp = 50;
#endregion

#region Инструментарий
flashlight = false;  // Включен фонарик
equip_weapon = noone;  // Текущее оружие "pistol"/"pipe"
can_fire = true;  // перезарядка
count_bullet = 0;  // Кол-во патронов в обойме
fl_captured = false; // захвачен ли Сомнением
//используется Сомнениями, чтобы узнать, можно ли захватывать героя (типа один захватил, другие ждут своей очереди)
#endregion

#region Анимация
frame = 0;
frameSpeed = .15;
#endregion