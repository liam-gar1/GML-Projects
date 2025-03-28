/// @description Insert description here
// You can write your code in this editor

with(TestInput6_2){
	if(keyboard_check_pressed(vk_anykey)){
		if(text4!="POLY" or text4!="400" or text4!="POLY 400" or text4!="FINISHING" or text4!="403" or text4!="FINISHING 403" or text4!="MAINT" or text4!="419" or text4!="MAINT 419" or text4!="NYLON" or text4!="402" or text4!="NYLON 402" or text4!="SITE SERVICES" or text4!="411" or text4!="SITE SERVICES 411" or text4!="CONVERTING" or text4!="000" or text4!="CONVERTING 000"){
			instance_destroy(TestNext2);
		} 
	}
}