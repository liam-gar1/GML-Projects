/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_anykey) and string_length(text4)<17){
	text5=text4+string(keyboard_string);
	text4=string_upper(text5);
	keyboard_string="";
	if(text4="POLY" or text4="400" or text4="POLY 400" or text4="FINISHING" or text4="403" or text4="FINISHING 403" or text4="MAINT" or text4="419" or text4="MAINT 419" or text4="NYLON" or text4="402" or text4="NYLON 402" or text4="SITE SERVICES" or text4="411" or text4="SITE SERVICES 411" or text4="CONVERTING" or text4="000" or text4="CONVERTING 000"){
		global.cost_centre=text4;
		instance_create_depth(1088,576,-30,TestNext2);
		if(text4="POLY" or text4="400" or text4="POLY 400"){
			global.cost_centre_label="POLY 400";
		}
		if(text4="FINISHING" or text4="403" or text4="FINISHING 403"){
			global.cost_centre_label="FINISHING 403";
		}
		if(text4="MAINT" or text4="419" or text4="MAINT 419"){
			global.cost_centre_label="MAINT 419"
		}
		if(text4="NYLON" or text4="402" or text4="NYLON 402"){
			global.cost_centre_label="NYLON 402";
		}
		if(text4="SITE SERVICES" or text4="411" or text4="SITE SERVICES 411"){
			global.cost_centre_label="SITE SERVICES 411";
		}
		if(text4="CONVERTING" or text4="000" or text4="CONVERTING 000"){
			global.cost_centre_label="CONVERTING 000";
		}
	}
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
//maybe comment this block out and uncomment below comment 

if(keyboard_check_pressed(vk_enter)){
	if(text4!="POLY" or text4!="400" or text4!="POLY 400" or text4!="FINISHING" or text4!="403" or text4!="FINISHING 403" or text4!="MAINT" or text4!="419" or text4!="MAINT 419" or text4!="NYLON" or text4!="402" or text4!="NYLON 402" or text4!="SITE SERVICES" or text4!="411" or text4!="SITE SERVICES 411" or text4!="CONVERTING" or text4!="000" or text4!="CONVERTING 000"){
		instance_create_layer(760,490,"Instances",TestErrMsg3);
	}
	if(text4="POLY" or text4="400" or text4="POLY 400" or text4="FINISHING" or text4="403" or text4="FINISHING 403" or text4="MAINT" or text4="419" or text4="MAINT 419" or text4="NYLON" or text4="402" or text4="NYLON 402" or text4="SITE SERVICES" or text4="411" or text4="SITE SERVICES 411" or text4="CONVERTING" or text4="000" or text4="CONVERTING 000"){
		//global.cost_centre=text4;
		instance_destroy(TestErrMsg3);
	}
} 

if(keyboard_check_pressed(vk_up)){
	global.temp_cost_centre=text4;
	global.temp_name="";
	instance_create_layer(800,288,"Instances",TestInput5_2);
	instance_destroy(TestInput5_4);
	instance_create_layer(880,448,"Instances",TestInput6_3);
	instance_destroy();
}