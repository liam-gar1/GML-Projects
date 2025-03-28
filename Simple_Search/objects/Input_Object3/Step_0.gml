//Input_Object3
/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(vk_anykey) and string_length(description_input)<20){
	text=description_input+string(keyboard_string);
	description_input=string_upper(text);
	keyboard_string="";
	with(Textbox_Object){
		sprite_index=NoResults0;
	}
}
if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer=2){
	description_input=string_delete(description_input,string_length(description_input),1);
	delete_timer=0;
	keyboard_string="";
}
if(keyboard_check_pressed(vk_backspace)){
	description_input=string_delete(description_input,string_length(description_input),1);
	keyboard_string="";
	delete_timer=-4;
}

var f; 
temp2=0;
temp3=0;
instance_create_layer(224,704,"Instances_1",Loading_Obj);
if(keyboard_check(vk_enter)){
	/*
	with Loading_Obj{
		sprite_index=Loading;
	} */
	//f=file_text_open_read(working_directory+"\inventory_test2.txt");
	f=file_text_open_read(working_directory+"\Complete_Inventory.txt");
	line=file_text_read_string(f);
	global.descResultsOrder=[];
	global.results=[];
	global.result_part_num=[];
	global.list_length=0;
	global.resultsIndex=0;
	for(i=0;i<=3000;i++){
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
		letter1=0;
		if(string_char_at(line,6)!="\\"){
			letter1=1;
		}
		num_index=8+letter1; //PART NUMBER CODE
		part_number="";
		temp=1;
		for(j=0;j<7;j++){
			part_number=string_insert(part_number,string_char_at(line,j+num_index),1); 
			if(string_char_at(line,j+num_index+1)="\\" and string_char_at(line,j+num_index+2)="t"){
				break;
			}  
			temp++;
		}
		for(k=temp+1;k<=(6);k++){
			part_number=string_insert(part_number,"0",k);
		}
		n=0;
		if(string_pos(description_input,description)!=0 and n<999){
			global.descResultsOrder[temp3]=string_length(description_input)/string_length(description);
			for(j=0;j<temp3;j++){
				if(global.descResultsOrder[j]=global.descResultsOrder[temp3]){
					n++;
					global.descResultsOrder[temp3]=string_length(description_input)/string_length(description)+n*0.001
				}
			} 
			array_sort(global.descResultsOrder,false);
			global.results[temp3]=description;
			global.result_part_num[temp3]=part_number;
			temp3++;
		}
	}
	//instance_create_layer(200,300,"Instances_1",TestObj);
	global.sorted_results=[];
	global.sorted_part_num=[];
	temp4=0;
	for(i=0;i<temp3;i++){
		for(j=0;j<temp3;j++){
			if(global.descResultsOrder[i]=string_length(description_input)/string_length(global.results[j])){
				global.sorted_results[temp4]=global.results[j];
				global.sorted_part_num[temp4]=global.result_part_num[j];
				temp4++;
			}
		}
	}
	file_text_close(f); 
	global.list_length=temp4;
	if(global.list_length=1 and global.descResultsOrder[0]=1){
		var f;
		//f=file_text_open_read(working_directory+"\inventory_test2.txt");
		f=file_text_open_read(working_directory+"\Complete_Inventory.txt");
		line=file_text_read_string(f); 
		temp2=0;
		for(i=0;i<=3000;i++){
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
			if(description_input=description){
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
		global.description=global.sorted_results[0];
		global.part_number=global.sorted_part_num[0];
		global.bin_location=bin_location;
		global.quantity=quantity;
		global.units=units;
		file_text_close(f);
		room_goto(Room6);
	}
}

if(keyboard_check(vk_enter) and description_input!=description and temp3=0){
	//instance_destroy(Loading_Obj);
	with(Textbox_Object){
		sprite_index=NoResults1;
	}
}

if(keyboard_check(vk_enter) and description_input!=description and global.list_length=1){
	global.description=description_input;
	instance_create_layer(736,192,"Instances_1",Input_Object3_2);
	instance_create_layer(726,336,"Instances_1",SearchResult1_2);
	instance_create_layer(1074,342,"Instances_1",SearchSelect1_2);
	//instance_destroy(Loading_Obj);
	instance_destroy();
}

if(keyboard_check(vk_enter) and description_input!=description and global.list_length=2){
	global.description=description_input;
	instance_create_layer(736,192,"Instances_1",Input_Object3_2);
	instance_create_layer(726,336,"Instances_1",SearchResult1_2);
	instance_create_layer(726,390,"Instances_1",SearchResult2_2);
	instance_create_layer(1074,342,"Instances_1",SearchSelect1_2);
	instance_create_layer(1074,396,"Instances_1",SearchSelect2_2);
	//instance_destroy(Loading_Obj);
	instance_destroy();
}

if(keyboard_check(vk_enter) and description_input!=description and global.list_length>2){
	global.description=description_input;
	instance_create_layer(736,192,"Instances_1",Input_Object3_2);
	instance_create_layer(726,336,"Instances_1",SearchResult1_2);
	instance_create_layer(726,390,"Instances_1",SearchResult2_2);
	instance_create_layer(786,450,"Instances_1",SearchResult3_2);
	instance_create_layer(1074,342,"Instances_1",SearchSelect1_2);
	instance_create_layer(1074,396,"Instances_1",SearchSelect2_2);
	instance_create_layer(1074,450,"Instances_1",SearchSelect3_2);
	if(global.list_length>3){
		instance_create_layer(736,512,"Instances_1",DownObj);
	}
	//instance_destroy(Loading_Obj);
	instance_destroy();
} 

//Handle Timer Update
if(delete_timer!=2){
	delete_timer++;
}