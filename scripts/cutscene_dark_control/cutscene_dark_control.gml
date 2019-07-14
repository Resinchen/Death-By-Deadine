// от текущего уровня темноты до указанного (0-100)
// 0 - светло, 100 - темно
// false - мнговенное изменение, true - с небольшой плавностью

var temp = argument0 - obj_cs_dark.percent;

if (temp == 0)
	cutscene_end_action();
else if (argument1)
	obj_cs_dark.percent += sign(temp);
else
{
	obj_cs_dark.percent = argument0;
	cutscene_end_action();
}