/// @description Insert description here
// You can write your code in this editor
index=0;
if(keyboard_check(vk_anykey) and string_length(text3)<10){
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
if(keyboard_check_pressed(vk_enter) and string_length(text3)<=1){
	instance_create_layer(960,260,"Instances",TestErrMsg2);
}
if(keyboard_check_pressed(vk_enter) and string_length(text3)>1){
	global.name=text3;
	instance_destroy(TestErrMsg2);
	instance_create_layer(150,410,"Instances",TestSelect1);
	instance_create_layer(880,448,"Instances",TestInput6_2);
	instance_destroy(TestInput6_1);
	instance_destroy(TestInput6_3);
	instance_create_layer(800,288,"Instances",TestInput5_4);
	instance_destroy();
}
//Handle Timer Update
if(delete_timer!=2){
	delete_timer++;
}
if(keyboard_check_pressed(vk_up)){
	global.temp_name=text3;
	global.name="";
	instance_create_layer(800,128,"Instances",TestInput4_1);
	with(TestInput4_1){
		sprite_index=After_Input;
	}
	instance_destroy(TestInput4_2);
	instance_create_layer(800,288,"Instances",TestInput5_3);
	if(string_length(text3)>1){
		instance_destroy(TestErrMsg2);
	}
	instance_destroy();
}