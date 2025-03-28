/// @description Insert description here
// You can write your code in this editor
index=0;
global.temp_update_quantity="";
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
if(keyboard_check_pressed(vk_enter) and string_length(text)=0){
	instance_create_layer(435,460,"Instances",X_Obj2);
	instance_destroy(FinishObj);
}
/*
else if(keyboard_check_pressed(vk_enter) and real(text)=0){
	instance_create_layer(435,460,"Instances",X_Obj2);
	instance_destroy(FinishObj);
} */
else if(keyboard_check_pressed(vk_enter) and string_length(text)!=0){
	text=string(real(text));
	global.update_quantity=text;
	instance_create_layer(345,520,"Instances",FinishObj);
	instance_destroy(X_Obj2);	
}

//Handle Timer Update
if(delete_timer!=2){
	delete_timer++;
}
if(keyboard_check_pressed(vk_up)){
	if(string_length(text)!=0){
		text=string(real(text));
	}
	global.update_quantity=text;
	instance_create_layer(310,390,"Instances",TextUpdObj1_3);
	instance_create_layer(310,460,"Instances",TextUpdObj2_3);
	instance_destroy(TextUpdObj1_2);
	instance_destroy(FinishObj);
	if(string_length(text)>0 and real(text)!=0){
		instance_destroy(X_Obj2);
	}
	instance_destroy();
}