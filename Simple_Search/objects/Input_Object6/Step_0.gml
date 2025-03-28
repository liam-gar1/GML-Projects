/// @description Insert description here
// You can write your code in this editor
if(global.Temp2=1 and global.Temp3=1){ 
	if(keyboard_check(vk_anykey) and string_length(text4)<10){
		text5=text4+string(keyboard_string);
		text4=string_upper(text5);
		keyboard_string="";
	}
	if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer=2){
		text4=string_delete(text4,string_length(text4),1);
		delete_timer=0;
		keyboard_string="";
	}
	if(keyboard_check_pressed(vk_backspace)){
		text4=string_delete(text4,string_length(text4),1);
		keyboard_string="";
		delete_timer=-4;
	}
	//Handle Timer Update
	if(delete_timer!=2){
		delete_timer++;
	}
}

