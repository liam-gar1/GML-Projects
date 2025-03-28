/// @description Insert description here
// You can write your code in this editor
index=0;
temp=0;
if(keyboard_check(vk_anykey) and string_length(text)<4){
	sprite_index=After_Input_5;
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
if(string_length(text)!=0){
	if(keyboard_check_pressed(vk_enter) and real(text)>real(global.quantity)){
		text=real(text);
		instance_destroy(TestErrMsg1_2);
		instance_create_layer(960,96,"Instances",TestErrMsg1);
	}
	if(keyboard_check_pressed(vk_enter) and real(text)=0){
		text=real(text);
		instance_destroy(TestErrMsg1);
		instance_create_layer(960,96,"Instances",TestErrMsg1_2);
	}
	if(keyboard_check_pressed(vk_enter) and real(text)!=0 and real(text)<=real(global.quantity)){
		text=real(text);
		global.sign_out_quantity=text;
		instance_destroy(TestErrMsg1);
		instance_destroy(TestErrMsg1_2);
		instance_destroy(TestInput5_3);
		instance_create_layer(800,288,"Instances",TestInput5_2);
		instance_destroy(TestInput5_1);
		instance_create_layer(800,128,"Instances",TestInput4_2);
		instance_destroy();
	}
}
/*
if(keyboard_check_pressed(vk_up){
	
}