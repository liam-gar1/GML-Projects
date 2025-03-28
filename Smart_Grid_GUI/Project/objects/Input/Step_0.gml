/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_anykey) and string_length(date)<20){
	text=date+string(keyboard_string);
	date=string_upper(text);
	keyboard_string="";
	instance_destroy(ErrorObj);
	instance_destroy(Object5);
	instance_destroy(Timer);
	instance_destroy(Object9);
	global.time=0;
	global.timer_s=0;
	global.timer_m=0;
	global.n=0;
}
if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer=2){
	date=string_delete(date,string_length(date),1);
	delete_timer=0;
	keyboard_string="";
}
if(keyboard_check_pressed(vk_backspace)){
	date=string_delete(date,string_length(date),1);
	keyboard_string="";
	delete_timer=-4;
} 

//Handle Timer Update
if(delete_timer!=2){
	delete_timer++;
}

if(keyboard_check(vk_enter)){
	month="";
	day="";
	for(i=0;i<=20;i++){
		month=string_insert(month,string_char_at(date,i+1),0);
		if(string_char_at(date,i+1)=" "){
			day=string_insert(day,string_char_at(date,i+2),0);
			if(i+3=string_length(date)){
				day=string_insert(day,string_char_at(date,i+3),0);
			} 
			break;
		}
	}
	global.day="";
	global.day=day;
	global.date="";
	global.date=date;
	global.month="";
	global.month=month;
	file=file_text_open_write(working_directory+"/Files/Load.txt");
	file_text_write_string(file,"..."); //Column Titles
	file_text_close(file); 
	
	if(string_char_at(date,string_length(date)-1)=" " and string_char_at(day,0)="1" or string_char_at(day,0)="2" or string_char_at(day,0)="3" or string_char_at(day,0)="4" or string_char_at(day,0)="5" or string_char_at(day,0)="6" or string_char_at(day,0)="7" or string_char_at(day,0)="8" or string_char_at(day,0)="9" and 0<real(string_char_at(day,0))<=9 or string_char_at(date,string_length(date)-2)=" " and string_char_at(day,1)="1" or string_char_at(day,1)="2" or string_char_at(day,1)="3" or string_char_at(day,1)="4" or string_char_at(day,1)="5" or string_char_at(day,1)="6" or string_char_at(day,1)="7" or string_char_at(day,1)="8" or string_char_at(day,1)="9" and 0<real(string_char_at(day,0))<=3 and 0<=real(string_char_at(day,1))<=9){
		if(string_char_at(month,1)="J" and string_char_at(month,2)="A" and string_char_at(month,3)="N" and string_char_at(month,4)="U" and string_char_at(month,5)="A" and string_char_at(month,6)="R" and string_char_at(month,7)="Y" and string_char_at(month,8)=" "){
			if(real(day)>31 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=31){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=0;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				//instance_create_layer(226,96,"Instances",Object6);
				//instance_create_layer(802,96,"Instances",Object7);
				//instance_create_layer(742,130,"Instances",Object12);
				//instance_create_layer(802,130,"Instances",Object13);
				instance_destroy(Object14);
				instance_create_layer(1250,32,"Instances",Timer);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(960,32,"Instances",Object9);
			}
		}
		else if(string_char_at(month,1)="F" and string_char_at(month,2)="E" and string_char_at(month,3)="B" and string_char_at(month,4)="R" and string_char_at(month,5)="U" and string_char_at(month,6)="A" and string_char_at(month,7)="R" and string_char_at(month,8)="Y" and string_char_at(month,9)=" "){
			if(real(day)>28 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=28){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=1;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="M" and string_char_at(month,2)="A" and string_char_at(month,3)="R" and string_char_at(month,4)="C" and string_char_at(month,5)="H" and string_char_at(month,6)=" "){
			if(real(day)>31 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=31){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=2;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="A" and string_char_at(month,2)="P" and string_char_at(month,3)="R" and string_char_at(month,4)="I" and string_char_at(month,5)="L" and string_char_at(month,6)=" "){
			if(real(day)>30 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=30){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=3;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="M" and string_char_at(month,2)="A" and string_char_at(month,3)="Y" and string_char_at(month,4)=" "){
			if(real(day)>31 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=31){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=4;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="J" and string_char_at(month,2)="U" and string_char_at(month,3)="N" and string_char_at(month,4)="E" and string_char_at(month,5)=" "){
			if(real(day)>30 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=30){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=5;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="J" and string_char_at(month,2)="U" and string_char_at(month,3)="L" and string_char_at(month,4)="Y" and string_char_at(month,5)=" "){
			if(real(day)>31 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=31){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=6;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="A" and string_char_at(month,2)="U" and string_char_at(month,3)="G" and string_char_at(month,4)="U" and string_char_at(month,5)="S" and string_char_at(month,6)="T" and string_char_at(month,7)=" "){
			if(real(day)>31 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=31){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=7;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="S" and string_char_at(month,2)="E" and string_char_at(month,3)="P" and string_char_at(month,4)="T" and string_char_at(month,5)="E" and string_char_at(month,6)="M" and string_char_at(month,7)="B" and string_char_at(month,8)="E" and string_char_at(month,9)="R" and string_char_at(month,10)=" "){
			if(real(day)>30 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=30){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=8;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="O" and string_char_at(month,2)="C" and string_char_at(month,3)="T" and string_char_at(month,4)="O" and string_char_at(month,5)="B" and string_char_at(month,6)="E" and string_char_at(month,7)="R" and string_char_at(month,8)=" "){
			if(real(day)>31 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=31){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=9;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="N" and string_char_at(month,2)="O" and string_char_at(month,3)="V" and string_char_at(month,4)="E" and string_char_at(month,5)="M" and string_char_at(month,6)="B" and string_char_at(month,7)="E" and string_char_at(month,8)="R" and string_char_at(month,9)=" "){
			if(real(day)>30 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=30){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=10;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else if(string_char_at(month,1)="D" and string_char_at(month,2)="E" and string_char_at(month,3)="C" and string_char_at(month,4)="E" and string_char_at(month,5)="M" and string_char_at(month,6)="B" and string_char_at(month,7)="E" and string_char_at(month,8)="R" and string_char_at(month,9)=" "){
			if(real(day)>31 or real(day)<1){
				instance_create_layer(640,192,"Instances",ErrorObj);
			}
			else if(0<real(day)<=31){
				with(Input){
					sprite_index=AfterInput1;
				}
				global.index=11;
				global.i=0;
				global.i_2=0;
				instance_create_layer(36,275,"Instances",Object5);
				instance_create_layer(1250,32,"Instances",Timer);
				instance_destroy(Object14);
				//instance_create_layer(1250,32,"Instances",Object22);
				//instance_create_layer(552,96,"Instances",Object6);
				//instance_create_layer(804,96,"Instances",Object7);
			}
		}
		else{
			with(Input){
				sprite_index=AfterInput;
			}
			instance_create_layer(640,192,"Instances",ErrorObj);	
		}
	}
	else{
		with(Input){
			sprite_index=AfterInput;
		}
		instance_create_layer(640,192,"Instances",ErrorObj);	
	}
}