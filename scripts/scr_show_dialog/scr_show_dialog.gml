// scr_show_dialog(who, text)
//@param who string
//@param text string

//Who`s:
/*
- Andrey
- Wife
- Daughter
- Storyteller (note and etc.)	
*/

inst = instance_create_depth(0, 0, -6, obj_textBox)
with (inst) {
	name = argument0
	text = argument1
}
