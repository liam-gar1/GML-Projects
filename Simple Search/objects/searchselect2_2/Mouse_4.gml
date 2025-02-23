//Search_Select2_2
/// @description Insert description here
// You can write your code in this editor
global.part_number=string(global.sorted_part_num[global.resultsIndex+1]);
global.description=string(global.sorted_results[global.resultsIndex+1]);
var f;
//f=file_text_open_read(working_directory+"\inventory_test2.txt");
f=file_text_open_read(working_directory+"\Complete_Inventory.txt");
line=file_text_read_string(f); 
temp2=0;
for(i=0;i<=4000;i++){
	file_text_readln(f); 
	line=file_text_read_string(f); 
	description=""; //PART DESCRIPTION CODE
	temp2=0;
	for(j=0;j<100;j++){
		if(string_char_at(line,j)="\\" and string_char_at(line,j+1)="t"){
			temp2++;
		}
		if(temp2=2 and string_char_at(line,j+1)="\\" and string_char_at(line,j+2)="t"){
			break;
		}
		if(temp2=2 and string_char_at(line,j+2)!="\\"){
			description=string_insert(description,string_upper(string_char_at(line,j+2)),0);
		}
	}	
	if(global.description=description){
		location_index=1; //BIN LOCATION CODE
		bin_location="";
		letter1=0;
		if(string_char_at(line,6)!="\\"){
			letter1=1;
		}
		for(j=0;j<=4+letter1;j++){
			bin_location=string_insert(bin_location,string_char_at(line,j+location_index),0);
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
	}
}
global.bin_location=bin_location;
global.quantity=quantity;
global.units=units
room_goto(Room6);

