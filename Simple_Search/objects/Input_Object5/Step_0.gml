/// @description Insert description here
// You can write your code in this editor
index=0;
if(global.Temp2=1 and global.Temp3=0){ 
	if(keyboard_check(vk_anykey) and string_length(text3)<10){
		global.Temp5=1;
		if(string_upper(keyboard_string[index])=" " or string_upper(keyboard_string[index])="A" or string_upper(keyboard_string[index])="B" or string_upper(keyboard_string[index])="C" or string_upper(keyboard_string[index])="D" or string_upper(keyboard_string[index])="E" or string_upper(keyboard_string[index])="F" or string_upper(keyboard_string[index])="G" or string_upper(keyboard_string[index])="H" or string_upper(keyboard_string[index])="I" or string_upper(keyboard_string[index])="J" or string_upper(keyboard_string[index])="K" or string_upper(keyboard_string[index])="L" or string_upper(keyboard_string[index])="M" or string_upper(keyboard_string[index])="N" or string_upper(keyboard_string[index])="O" or string_upper(keyboard_string[index])="P" or string_upper(keyboard_string[index])="Q" or string_upper(keyboard_string[index])="R" or string_upper(keyboard_string[index])="S" or string_upper(keyboard_string[index])="T" or string_upper(keyboard_string[index])="U" or string_upper(keyboard_string[index])="V" or string_upper(keyboard_string[index])="W" or string_upper(keyboard_string[index])="X" or string_upper(keyboard_string[index])="Y" or string_upper(keyboard_string[index])="Z"){
			text2=text3+string(keyboard_string);
			text3=string_upper(text2);
			keyboard_string="";
			index++;
		}
	}
	if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer=2){
		text3=string_delete(text3,string_length(text3),1);
		delete_timer=0;
		keyboard_string="";
	}
	if(keyboard_check_pressed(vk_backspace)){
		text3=string_delete(text3,string_length(text3),1);
		keyboard_string="";
		delete_timer=-4;
	}
	if(keyboard_check_pressed(vk_enter) and global.Temp5=1 and string_length(text3)<=1){
		with(ErrMsg2){
			sprite_index=ErrorMessage2;
		}
	}
	if(keyboard_check_pressed(vk_enter) and global.Temp5=1 and string_length(text3)>1){
		global.Temp3=1;
		with(ErrMsg2){
			sprite_index=ErrorMessage0;
		}
		with(Input_Object6){
			sprite_index=After_Input;
		}
	}
	//Handle Timer Update
	if(delete_timer!=2){
		delete_timer++;
	}
}
if(global.Temp2=1 and global.Temp3=1 and keyboard_check_pressed(vk_up)){
	global.Temp3=0;
}