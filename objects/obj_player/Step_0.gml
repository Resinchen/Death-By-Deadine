#region Sprite Pack
switch (sprite_pack)
{
	case PlayerSprites.Shirt:
		sprite_idle = spr_player_shirt_idle;
		sprite_walk = spr_player_shirt_walk;
		sprite_damage = spr_player_shirt_idle;
		sprite_targeting = spr_player_shirt_idle;
		sprite_attack = spr_player_shirt_idle;
		break;
		
	case PlayerSprites.Jacket:
		sprite_idle = spr_player_jacket_idle;
		sprite_walk = spr_player_jacket_walk;
		sprite_damage = spr_player_jacket_idle;
		sprite_targeting = spr_player_jacket_idle;
		sprite_attack = spr_player_jacket_idle;
		break;
		
	case PlayerSprites.Pipe:
		sprite_idle = spr_player_jacket_idle;
		sprite_walk = spr_player_pipe_walk;
		sprite_damage = spr_player_pipe_damage;
		sprite_targeting = spr_player_pipe_targeting;
		sprite_attack = spr_player_pipe_attack;
		break;
		
	case PlayerSprites.Pistol:
		sprite_idle = spr_player_jacket_idle;
		sprite_walk = spr_player_pistol_walk;
		sprite_damage = spr_player_pistol_damage;
		sprite_targeting = spr_player_pistol_targeting;
		sprite_attack = spr_player_pistol_attack;
		break;
}
#endregion

#region Переключение оружия
if (keyboard_check_pressed(ord("Q")))
{
	if (has_pipe && has_pistol)
	{
		if (equip_weapon == "pistol")
		{
			equip_weapon = "pipe";
			sprite_pack = PlayerSprites.Pipe;
		}
		else
		{
			equip_weapon = "pistol";
			sprite_pack = PlayerSprites.Pistol;
		}
	}
	else if (has_pipe)
	{
		sprite_pack = PlayerSprites.Pipe;
		equip_weapon = "pipe";
	}
	else if (has_pistol)
	{
		sprite_pack = PlayerSprites.Pistol;
		equip_weapon = "pistol";
	}
}
#endregion

#region State
switch (state)
{
	case PlayerState.Idle:
		if (hsp*hsp + vsp*vsp != 0) {
			state = PlayerState.Walking;
			if (!audio_is_playing(sound_footsteps))
				audio_play_sound(sound_footsteps, 2, true);
			}
		if (mouse_check_button(mb_right)) state = PlayerState.Targeting;
		if(hp <= 0) state = PlayerState.Dead;
		break;
		
	case PlayerState.Walking:
		if (hsp*hsp + vsp*vsp == 0) {state = PlayerState.Idle; audio_stop_sound(sound_footsteps);}
		if (mouse_check_button(mb_right)) state = PlayerState.Targeting;
		if(hp <= 0) state = PlayerState.Dead;
		break;
		
	case PlayerState.Damaged:
		audio_play_sound(damageSound[floor(random_range(0,4))], 2, false);
		instance_create_layer(x,y, "Instances", obj_blood);
		state = PlayerState.Walking;
		if(hp <= 0) state = PlayerState.Dead;
		break;
		
	case PlayerState.Targeting:
		if (hsp*hsp + vsp*vsp == 0) audio_stop_sound(sound_footsteps);
		else if (!audio_is_playing(sound_footsteps)) audio_play_sound(sound_footsteps, 2, true);
		if (mouse_check_button_released(mb_right)) state = PlayerState.Idle;
		if (mouse_check_button_pressed(mb_left) && can_fire) state = PlayerState.Attacking;
		if(hp <= 0) state = PlayerState.Dead;
		break;
		
	case PlayerState.Attacking:
		if (hsp*hsp + vsp*vsp == 0) audio_stop_sound(sound_footsteps);
		else if (!audio_is_playing(sound_footsteps)) audio_play_sound(sound_footsteps, 2, true);
		if (mouse_check_button_released(mb_right)) state = PlayerState.Idle;
		if(hp <= 0) state = PlayerState.Dead;
		break;
		
	case PlayerState.Dead:
		audio_stop_all();
		break;
}
#endregion

#region Движение

keyRight = keyboard_check(ord("D"));
keyLeft = -keyboard_check(ord("A"));
keyUp = -keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

hMove = keyLeft + keyRight;
vMove = keyUp + keyDown;


hsp = hMove * moveSpeed;
vsp = vMove * moveSpeed;


if (place_meeting(x + hsp, y, obj_solid))
{
	show_debug_message("I collide h");
	while(!place_meeting(x + sign(hsp), y, obj_solid))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

if (place_meeting(x, y + vsp, obj_solid))
{	
	show_debug_message("I collide v");
	while(!place_meeting(x, y + sign(vsp), obj_solid))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

x += hsp;
y += vsp;
#endregion

#region Вращение и анимация
if (state != PlayerState.Dead) heroAngle = point_direction(x,y,mouse_x,mouse_y)-90;
frame += frameSpeed;
#endregion

#region Предметы
if (keyboard_check_pressed(ord("E")) && place_meeting(x, y, obj_item_base))
{
	item = instance_nearest(x, y, obj_item_base);
	show_debug_message("I get item: " + item.name);
	with(item)
	{
		instance_destroy();
	}
}
#endregion

#region Осмотр
if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_table) <= 1)
{
	scr_show_dialog("Андрей", "Этот компьютер не работает.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_veshalka) <= 1)
{
	scr_show_dialog("Андрей", "Пустая вешалка. Все давно разошлись по домам.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_ruins) <= 1 && room == room_koridor1)
{
	scr_show_dialog("Андрей", "Дальше по коридору лифт, но путь преграждает завал. Стоп, завал?!");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_ruins) <= 1 && room == room_koridor2)
{
	scr_show_dialog("Андрей", "У меня есть время разглядывать завал? Я уже почти у цели.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_coffee) <= 1)
{
	scr_show_dialog("Андрей", "Кофемашина. Нет времени на кофе.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_wending) <= 1)
{
	scr_show_dialog("Андрей", "Вендинговый автомат. Я не голоден.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_foodtable) <= 1)
{
	scr_show_dialog("Андрей", "Стол на четверых, на нём стоит миска с яблоками.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_printer) <= 1)
{
	scr_show_dialog("Андрей", "Офисный принтер. Выключен, как и компьютеры.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_plant) <= 1)
{
	scr_show_dialog("Андрей", "Офисное растение с большими листьями.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_planshet) <= 1)
{
	scr_show_dialog("Андрей", "Планшет для письма маркерами, на нём остались надписи.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_bookshell) <= 1)
{
	scr_show_dialog("Андрей", "Шкафчик с папками и справочниками.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_cooler) <= 1)
{
	scr_show_dialog("Андрей", "Кулер с бутылкой воды.");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_false_door) <= 1)
{
	scr_show_dialog("Андрей", "Дверь нарисована мелом?.. Что за?..");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_doubt_dead) <= 1)
{
	scr_show_dialog("Андрей", "Что это за существо?.. Откуда оно здесь?!");
}
else if (keyboard_check_pressed(ord("E")) && distance_to_object(obj_book_page) <= 1)
{
	scr_show_dialog("Андрей", "\"Но маленькая звёздочка была настолько яркой, что из-за своего света не видела перед собой совсем ничего.\" Похоже, это из какой-то детской сказки, не припомню, чтобы читал её. И что она делает тут?..");
}
#endregion

#region Двери
if(keyboard_check_pressed(ord("E")) && distance_to_object(obj_door) <= 1)
{
		door = instance_nearest(x,y,obj_door);
		player_x = door.player_x;
		player_y = door.player_y;
		audio_play_sound(sound_door, 2, false);
		room_goto(door.door_room);
}


if(keyboard_check_pressed(ord("E")) && distance_to_object(obj_false_door) <= 1)
{
	door = instance_nearest(x,y,obj_false_door);
	if(door.active)
	{
		player_x = door.player_x;
		player_y = door.player_y;
		audio_play_sound(sound_door, 2, false);
		room_goto(door.door_room);
	}
}
#endregion

#region Фонарик
if (keyboard_check_pressed(ord("F")))
{
	show_debug_message("I am switch torch");
	flashlight = !flashlight;
	if(flashlight)
	{
		instance_create_depth(0,0,0, obj_flashlight);
		instance_destroy(obj_dark);
	}
	else
	{
		instance_create_depth(0,0,0, obj_dark);
		instance_destroy(obj_flashlight);
	}
}
#endregion

#region Атака
if (mouse_check_button(mb_right))
{
	show_debug_message("I am targeting");
	if (mouse_check_button_pressed(mb_left))
	{
		show_debug_message("I am fire");
		if (can_fire) 
		{
			if (equip_weapon == "pistol")
			{
				audio_play_sound(sound_pistol, 2, false)
				bullet = instance_create_depth(x, y, 0, obj_bullet);
				bullet.speed = 15;
				bullet.direction = heroAngle+90;
				count_bullet++;
			
				if(count_bullet >= 12)
				{
					audio_play_sound(sound_reload, 2, true);
					can_fire = false;
					alarm[0] = 30*3
				}
			} 
			else if (equip_weapon == "pipe")
			{
				audio_play_sound(sound_swish, 2, false);
				var _list = ds_list_create();
				var _num = collision_circle_list(x, y, 50, oEnemy, false, true, _list, false);
				if (_num > 0)
				{
					for (var i = 0; i < _num; ++i;)
			        {
						_list[| i].hp--;
			        }
				}
				ds_list_destroy(_list);
				can_fire = false;
				alarm[0] = 30*1.2
			}
		}
	}
}
#endregion