/// @description Insert description here
// You can write your code in this editor
index=0;
if(global.Temp2=0){
	if(keyboard_check(vk_anykey) and string_length(text)<4){
		if(keyboard_string[index]="0" or keyboard_string[index]="1" or keyboard_string[index]="2" or keyboard_string[index]="3" or keyboard_string[index]="4" or keyboard_string[index]="5" or keyboard_string[index]="6" or keyboard_string[index]="7" or keyboard_string[index]="8" or keyboard_string[index]="9"){
			text1=text+string(keyboard_string);
			text=string_upper(text1);
			keyboard_string="";
			index++;
		}
	}
	if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer=2){
		text=string_delete(text,string_length(text),1);
		delete_timer=0;
		keyboard_string="";
	}
	if(keyboard_check_pressed(vk_backspace)){
		text=string_delete(text,string_length(text),1);
		keyboard_string="";
		delete_timer=-4;
	}
	//Handle Timer Update
	if(delete_timer!=2){
		delete_timer++;
	}
	if(keyboard_check_pressed(vk_enter) and real(text)>real(global.quantity)){
		with(ErrMsg1){
			sprite_index=ErrorMessage1;
		}
	}
	if(keyboard_check_pressed(vk_enter) and real(text)<=real(global.quantity)){
		global.Temp2=1;
		with(ErrMsg1){
			sprite_index=ErrorMessage0;
		}
		with(Input_Object5){
			sprite_index=After_Input;
		}
	}
}
if(global.Temp2=1 and global.Temp3=0 and keyboard_check_pressed(vk_up)){
	global.Temp2=0;
}