//FinishObj
/// @description Insert description here
// You can write your code in this editor



global.quantity=global.update_quantity;

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
					list[i]=string_delete(list[i],k+1,string_length(list[i]));
					//list[i]=string_delete(list[i],k+1,string_length(list[i]-k+1));
					list[i]=string_insert(list[i],global.quantity+"\tEA",-1);
					//list[i]=string_insert(list[i],global.quantity,1-k);
					break;
				}
			}
		}
	}
} */

/*
for(i=0;i<=global.list_length;i++){
	letter1=0;
	if(string_char_at(line,6)!="\\"){
		letter1=1;
	}
	identification="";
	for(j=8+letter1;j<=20;j++){
		identification=string_insert(identification,string_char_at(list[i],j),0);
		if(string_char_at(list[i],j+1)="\\" and string_char_at(list[i],j+2)="t"){
			break;
		}
	}
	if(identification=string(real(global.part_number))){
		tabs=0;
		for(k=0;k<=100;k++){
			if(string_char_at(list[i],k)="\\" and string_char_at(list[i],k+1)="t"){
				tabs++;
			}
			if(tabs=3){
				list[i]=string_delete(list[i],k+2,string_length(list[i]));
				list[i]=string_insert(list[i],global.quantity+"\\t"+global.units,-1);
				break;
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
/*
list=[];
file=file_text_open_read(working_directory+"\Movement_History.txt");
for(i=0;i<10000;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);
	if(string_length(line)=0){
		break;
	}
	list[i]=line;
	global.History_length=i;
}
file_text_close(file);

file=file_text_open_write(working_directory+"\Movement_History.txt");

file_text_close(file); */

instance_create_layer(90,300,"Instances",UpdateObj);
instance_destroy(UpdateObj2);
instance_destroy(CloseObj2);
instance_destroy(TextUpdObj1_2);
instance_destroy(TextUpdObj2_2);
instance_destroy(Text_Obj3);
instance_destroy(Text_Obj4);
instance_destroy()