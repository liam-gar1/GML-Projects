//YesObj2
/// @description Insert description here
// You can write your code in this editor

//Cost Centre Number Code

/*
global.cost_centre_num="";
n=0;
Temp=100;
if(global.cost_centre_label="SITE SERVICES 411"){
	global.cost_centre_num="411";
}
else{
for(i=0;i<=Temp+3;i++){
	if(n!=0){
		global.cost_centre_num=string_insert(global.cost_centre_num,string_char_at(global.cost_centre_label,i),0);
	}
	if(string_char_at(global.cost_centre_label,i)=" "){
		//if(string_char_at(global.cost_centre_label,i+1)="1" or string_char_at(global.cost_centre_label,i+1)="2" or string_char_at(global.cost_centre_label,i+1)="3" or string_char_at(global.cost_centre_label,i+1)="4" or string_char_at(global.cost_centre_label,i+1)="5" or string_char_at(global.cost_centre_label,i+1)="6" or string_char_at(global.cost_centre_label,i+1)="7" or string_char_at(global.cost_centre_label,i+1)="8" or string_char_at(global.cost_centre_label,i+1)="9" or string_char_at(global.cost_centre_label,i+1)="0"){
			Temp=i;
			n=1;
		//}
	}
	else{
		Temp=100;
		n=0;
	}
	//}
}
} */

global.cost_centre_num="";
n=0;
Temp=100;
if(global.cost_centre_label="SITE SERVICES 411"){
	global.cost_centre_num="411";
}
else{
	for(i=0;i<=Temp+3;i++){
		if(n!=0){
			global.cost_centre_num=string_insert(global.cost_centre_num,string_char_at(global.cost_centre_label,i),0);
		}
		if(string_char_at(global.cost_centre_label,i)=" "){
			Temp=i;
			n=1;
		}
	}
}
/*
global.cost_centre_num_excel="";
if(global.cost_centre_num="000"){
	global.cost_centre_num_excel="=TEXT(0,\"000\")";
}
else{
	global.cost_centre_num_excel="=TEXT("+global.cost_centre_num+",\"000\")";
} */

file=file_text_open_append(working_directory+"\Sign_Out.txt");
//file_text_write_string(file,"=TEXT("+string(real(global.part_number))+",\"000000\")\t"+global.cost_centre_num_excel+"\t"+string(global.sign_out_quantity)+"\t"+string(global.bin_location)+"\t"+string(global.description)+"\t"+string(global.name)+"\n");
file_text_write_string(file,string(global.part_number)+"\\t"+global.cost_centre_num+"\\t"+string(global.sign_out_quantity)+"\\t"+string(global.bin_location)+"\\t"+string(global.description)+"\\t"+string(global.name)+"\n");
file_text_close(file);

global.quantity=string(global.quantity-global.sign_out_quantity);

list=[];
//file=file_text_open_read(working_directory+"\inventory_test2.txt");
file=file_text_open_read(working_directory+"\Complete_Inventory.txt");
for(i=0;i<10000;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);
	if(string_length(line)=0){
		break;
	}
	list[i]=line;
	global.list_length=i;
}
file_text_close(file);
/*
for(i=0;i<=global.list_length;i++){
	identification="";
	for(j=1;j<=5;j++){
		identification=string_insert(identification,string_char_at(list[i],j),0);
		if(identification=global.bin_location){
			tabs=0;
			for(k=0;k<=100;k++){
				if(string_char_at(list[i],k)="\t"){
					tabs++;
				}
				if(tabs=3){
					list[i]=string_delete(list[i],k+1,string_length(list[i]-k+1));
					list[i]=string_insert(list[i],global.quantity,1-k);
					break;
				}
			}
		}
	}
} */

for(i=0;i<=global.list_length;i++){
	letter1=0;
	if(string_char_at(list[i],6)!="\\"){
		letter1=1;
	}
	identification1="";
	for(j=8+letter1;j<=20;j++){
		identification1=string_insert(identification1,string_char_at(list[i],j),0);
		if(string_char_at(list[i],j+1)="\\" and string_char_at(list[i],j+2)="t"){
			break;
		}
	}
	identification2=""
	for(j=0;j<=4+letter1;j++){
		identification2=string_insert(identification2,string_char_at(list[i],j+1),0);
	}
	if(identification1=string(global.part_number) and identification2=string(global.bin_location)){
		tabs=0;
		for(k=0;k<=100;k++){
			if(string_char_at(list[i],k)="\\" and string_char_at(list[i],k+1)="t"){
				tabs++;
			}
			if(tabs=3){
				list[i]=string_delete(list[i],k+2,string_length(list[i]));
				list[i]=string_insert(list[i],global.quantity+"\\t"+global.units,0);
				break;
			}
		}
	}
}

//file=file_text_open_write(working_directory+"\inventory_test2.txt");
file=file_text_open_write(working_directory+"\Complete_Inventory.txt");
for(i=0;i<=global.list_length;i++){
	file_text_write_string(file,list[i]);
	file_text_writeln(file);
}
file_text_close(file);

room_goto(Room6);

