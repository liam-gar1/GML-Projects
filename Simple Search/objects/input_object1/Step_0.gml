//Input_Object1
/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_anykey) and string_length(part_input)<6){
	text=part_input+string(keyboard_string);
	part_input=string_upper(text);
	keyboard_string="";
	with(Textbox_Object){
		sprite_index=NoResults0;
	}
}
if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer=2){
	part_input=string_delete(part_input,string_length(part_input),1);
	delete_timer=0;
	keyboard_string="";
}
if(keyboard_check_pressed(vk_backspace)){
	part_input=string_delete(part_input,string_length(part_input),1);
	keyboard_string="";
	delete_timer=-4;
}

var f;
//f=file_text_open_read(working_directory+"\inventory_test.txt");
//f=file_text_open_read(working_directory+"\inventory_test2.txt");
f=file_text_open_read(working_directory+"\Complete_Inventory.txt");
line=file_text_read_string(f); 
temp2=0;
if(keyboard_check(vk_enter)){
	for(i=0;i<=4000;i++){
		file_text_readln(f); 
		line=file_text_read_string(f); 
		//num_index=7; //PART NUMBER CODE
		letter1=0;
		if(string_char_at(line,6)!="\\"){
			letter1=1;
		}
		num_index=8+letter1;
		part_number="";
		temp=1;
		for(j=0;j<7;j++){
			part_number=string_insert(part_number,string_char_at(line,j+num_index),1); 
			//if(string_char_at(line,j+num_index+1)="\t"){
			if(string_char_at(line,j+num_index+1)="\\" and string_char_at(line,j+num_index+2)="t"){
				break;
			}  
			temp++;
		}
		//for(k=temp+1;k<=(6);k++){
		for(k=temp+2;k<=(7);k++){
			part_number=string_insert(part_number,"0",k);
		}
		if(part_input=part_number){			
			location_index=1; //BIN LOCATION CODE
			bin_location="";
			for(j=0;j<=4+letter1;j++){
				bin_location=string_insert(bin_location,string_char_at(line,j+location_index),0);
			}
			description=""; //PART DESCRIPTION CODE
			temp2=0;
			for(j=0;j<100;j++){
				//if(string_char_at(line,j)="\t"){
				if(string_char_at(line,j)="\\" and string_char_at(line,j+1)="t"){
					temp2++;
				}
				//if(temp2=2 and string_char_at(line,j+1)="\t"){
				if(temp2=2 and string_char_at(line,j+2)="\\" and string_char_at(line,j+3)="t"){
					break;
				}
				if(temp2=2){
					description=string_insert(description,string_char_at(line,j+2),0);
				}
			}
			num_tabs=0; //QUANTITY CODE
			quantity="";
			for(j=0;j<=100;j++){
				//if(string_char_at(line,j)="\t"){
				if(string_char_at(line,j)="\\" and string_char_at(line,j+1)="t"){
					num_tabs++;
				}
				if(num_tabs=3){
					quantity=string_insert(quantity,string_char_at(line,j+2),0);
					//if(string_char_at(line,j+2)="\t"){
					if(string_char_at(line,j+3)="\\" and string_char_at(line,j+4)="t"){
						break;
					}
				}
			}
			units=""; //UNITS CODE
			units=string_insert(units,string_char_at(line,string_length(line)-1),1);
			units=string_insert(units,string_char_at(line,string_length(line)),1);
			global.part_number=part_input
			global.bin_location=bin_location;
			global.description=string_upper(description);
			global.quantity=quantity;
			global.units=units;
			room_goto(Room6);
		}
	}
}
file_text_close(f);

if(keyboard_check(vk_enter) and part_input!=part_number){
	with(Textbox_Object){
		sprite_index=NoResults1;
	}
} 

//Handle Timer Update
if(delete_timer!=2){
	delete_timer++;
}