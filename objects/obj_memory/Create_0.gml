hp = 3;
moveSpeed = 3;

timerIdle = 30;
timerAttack = 0;
timerDead = 7*room_speed;
timerDamage = room_speed/2;
timerRebirth = 2*room_speed;;

enum State
{
	Idle,
	Running,
	Attacking,
	Damaged,
	Dead,
	Rebirth
}

state = State.Idle;
sprite_index = spr_memory_idle;