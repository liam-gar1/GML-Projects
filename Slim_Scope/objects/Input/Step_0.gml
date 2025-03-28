/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_anykey) and string_length(search)<20){
	with(BoxObj){
		sprite_index=TextBox;
	}
	text=search+string(keyboard_string);
	search=string_upper(text);
	keyboard_string="";
}
if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer=2){
	search=string_delete(search,string_length(search),1);
	delete_timer=0;
	keyboard_string="";
}
if(keyboard_check_pressed(vk_backspace)){
	search=string_delete(search,string_length(search),1);
	keyboard_string="";
	delete_timer=-4;
} 

//Handle Timer Upsearch
if(delete_timer!=2){
	delete_timer++;
}







