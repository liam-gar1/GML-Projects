/// @description Insert description here
// You can write your code in this editor
//startX=0;
//startY=0;

//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
/*
for(var xx=0; xx< ds_grid_width(stats_grid); xx++){
	for(var yy=0; yy<ds_grid_height(stats_grid); yy++){
		statToShow=stats_grid[# xx, yy];
		var drawX = (startX + (xx*400));
		var drawY= startY+(yy*100);
		draw_text(drawX,drawY,statToShow);
	}
} */

//var2=var1[# 3, 1];
//draw_text(0,0,var2);
//var2=3;
//var1[# 3, 1]=3;
//var3=var1[# 3, 1];
//draw_text(0,400, var3);

//draw_text(0,0,var1[# 1, 1]);

/*
var f;
f=file_text_open_write(working_directory+"\inventory_test.txt");
file_text_write_string(f,"Bin Location\tPart Number\tDescription\tQuantity");
file_text_writeln(f);
file_text_write_string(f,"09P58\t000001\tGloves\t2");
file_text_writeln(f);
file_text_write_string(f,"19P19\t000002\tWinter Gloves\t2");
file_text_close(f); */

//var f;
//f=file_text_open_read(working_directory+"\inventory_test.txt"); /*
/*temp=file_text_read_string(f);
test3=string_pos("Description",temp);
draw_text(0,50,test3);
//draw_text(0,400,temp)
num=14;
draw_text(0,0,string_char_at(temp,num));
new_string="";

for(i=0;i<=100;i++){
	new_string=string_insert(new_string,string_char_at(temp,num+i),0); 
	if(string_char_at(temp,num+i+1)="	"){
		break;
	} 
} /*
new_string=string_insert(new_string,string_char_at(temp,26),0);
new_string=string_insert(new_string,string_char_at(temp,27),0);
new_string=string_insert(new_string,string_char_at(temp,28),0);
new_string=string_insert(new_string,string_char_at(temp,29),0); */
//draw_text(0,100,new_string);   



//file_text_read_string(f);
//file_text_readln(f);
//line=file_text_read_string(f);
//file_text_readln(f);
//line=file_text_read_string(f); 
/*num1=1;
new_string2="";
for(i=0;i<=4;i++){
	new_string2=string_insert(new_string2,string_char_at(line,i+num1),0); /*
	if(string_char_at(temp,i+1)="	"){
		break;
	}  */
/*}
draw_text(0,150,new_string2);
num2=7;
new_string3="";
for(i=0;i<=5;i++){
	new_string3=string_insert(new_string3,string_char_at(line,i+num2),0); 
	if(string_char_at(line,i+num2+1)="\t"){
		break;
	}  
}
draw_text(0,200,new_string3);
n=0;
new_string4="";
for(i=0;i<=100;i++){
	if(string_char_at(line,i)="\t"){
		n++;
	}
	if(n=3){
		new_string4=string_insert(new_string4,string_char_at(line,i+1),0);
		if(string_char_at(line,i+2)="\t"){
			break;
		}
	}
}
draw_text(0,250,new_string4);
num_string="001020";
draw_text(0,300,real(num_string)); 
*/

//CODE BELOW WORKS 
/*
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var f;
f=file_text_open_read(working_directory+"\inventory_test.txt");
line=file_text_read_string(f); //Column Titles

file_text_readln(f); 
line=file_text_read_string(f); //Part 1 
/*file_text_readln(f); 
line=file_text_read_string(f); //Part 2
file_text_readln(f); 
line=file_text_read_string(f); //Part 3
file_text_readln(f); 
line=file_text_read_string(f); //Part 4
file_text_readln(f);
line=file_text_read_string(f); //Part 5 
*/ /*
num3=7; //PART NUMBER CODE
new_string5="";
temp2=1;
for(i=0;i<6;i++){
	new_string5=string_insert(new_string5,string_char_at(line,i+num3),1); 
	if(string_char_at(line,i+num3+1)="\t"){
		break;
	}  
	temp2++;
}
for(i=temp2+1;i<=(6);i++){
	new_string5=string_insert(new_string5,"0",i);
}
draw_text(0,350,new_string5); //PRINTS PART NUMBER 

num5=1; //BIN LOCATION CODE
new_string7="";
for(i=0;i<=4;i++){
	new_string7=string_insert(new_string7,string_char_at(line,i+num5),0);
}
draw_text(0,400,new_string7); //PRINTS BIN LOCATION

new_string8=""; //PART DESCRIPTION CODE
temp3=0;
for(i=0;i<100;i++){
	if(string_char_at(line,i)="\t"){
		temp3++;
	}
	if(temp3=2 and string_char_at(line,i+1)="\t"){
		break;
	}
	if(temp3=2){
		new_string8=string_insert(new_string8,string_char_at(line,i+1),0);
	}
}
draw_text(0,450,new_string8); //PRINTS DESCRIPTION

n2=0; //QUANTITY CODE
new_string9="";
for(i=0;i<=100;i++){
	if(string_char_at(line,i)="\t"){
		n2++;
	}
	if(n2=3){
		new_string9=string_insert(new_string9,string_char_at(line,i+1),0);
		if(string_char_at(line,i+2)="\t"){
			break;
		}
	}
}
draw_text(0,500,new_string9); //PRINTS QUANTITY

file_text_close(f);


/*
var f;
f=file_text_open_write(working_directory+"\inventory_test.txt");
file_text_write_string(f,"Bin Location\tPart Number\tDescription\tQuantity");
file_text_writeln(f);
file_text_write_string(f,"09P58\t000001\tGloves\t2");
file_text_writeln(f);
file_text_write_string(f,"19P19\t000002\tWinter Gloves\t2");
file_text_close(f); */
/*
var file;
file=file_text_open_append(working_directory+"\Sign_Out.txt");
file_text_write_string(file,"\n"+string(global.part_number)+"\t\t"+string(global.sign_out_quantity)+"\t"+string(global.bin_location)+"\t"+string(global.description)+"\t"+string(global.name));
file_text_close(file); 
*/ /*
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
} */

//list=ds_list_create();
//list=[];
//list[0]="This is element 0.";
//list[1]="This is element 1.";

//draw_text(200,450,global.cost_centre_num);
//draw_text(200,480,global.quantity);

//draw_text(200,510,list[0]);
//draw_text(200,540,list[1]);

/*
list=[];
f=file_text_open_read(working_directory+"\inventory_test.txt");
line=file_text_read_string(f); //Column Titles
file_text_readln(f);
list[0]=line; 
line=file_text_read_string(f); //Part 1 
file_text_readln(f);
list[1]=line; 
line=file_text_read_string(f); //Part 1 
file_text_readln(f);
list[2]=line; 
line=file_text_read_string(f); //Part 1 
file_text_readln(f);
list[3]=line; 
line=file_text_read_string(f); //Part 1 
file_text_readln(f);
list[4]=line; 
line=file_text_read_string(f); //Part 1 
file_text_readln(f);
list[5]=line; 
line=file_text_read_string(f); //Part 1 
file_text_readln(f);
list[6]=line; 
file_text_close(f); */
/*
list=[];
file=file_text_open_read(working_directory+"\inventory_test.txt");
for(i=0;i<10000;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);
	if(string_length(line)=0){
		break;
	}
	list[i]=line;
	global.list_length=i;
}
file_text_close(file); */

/*
identification="";
for(i=1;i<=5;i++){
	identification=string_insert(identification,string_char_at(list[1],i),0);
	if(identification=global.bin_location){
		
	}
}*/
 /*
for(i=0;i<=global.list_length;i++){
	identification="";
	for(j=1;j<=5;j++){
		identification=string_insert(identification,string_char_at(list[i],j),0);
		if(identification=global.bin_location){
			tabs=0;
			stri="correct";
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
}

draw_text(500,120,list[0]+"\t"+string(string_length(list[0])));
draw_text(500,180,list[1]+"\t"+string(string_length(list[1])));
draw_text(500,240,list[2]+"\t"+string(string_length(list[2])));
draw_text(500,300,list[3]+"\t"+string(string_length(list[3])));
draw_text(500,360,list[4]+"\t"+string(string_length(list[4]))); */
/*
file=file_text_open_write(working_directory+"\inventory_test.txt");
for(i=0;i<=global.list_length;i++){
	file_text_write_string(file,list[i]);
	file_text_writeln(file);
}
file_text_close(file); */

//draw_text(500,480,identification);

//draw_text(500,480,list[6]+"\t"+string(string_length(list[6])));
//draw_text(500,480,list[6]+"\t"+string(ds_list_size(list)));

/*file_text_readln(f); 
line=file_text_read_string(f); //Part 2
file_text_readln(f); 
line=file_text_read_string(f); //Part 3
file_text_readln(f); 
line=file_text_read_string(f); //Part 4
file_text_readln(f);
line=file_text_read_string(f); //Part 5 


//From Input_Obj3 below...

/*
if(keyboard_check(vk_enter) and description_input="GLOVES"){
	//global.description=text;
	room_goto(Room6);
}
if(keyboard_check(vk_enter) and description_input!="GLOVES"){
	with(Textbox_Object){
		sprite_index=NoResults1;
	}
} */
/*
var f;
f=file_text_open_read(working_directory+"\inventory_test.txt");
line=file_text_read_string(f); 
temp2=0;
if(keyboard_check(vk_enter)){
	for(i=0;i<=40;i++){
		file_text_readln(f); 
		line=file_text_read_string(f); 
		description=""; //PART DESCRIPTION CODE
		temp2=0;
		for(j=0;j<100;j++){
			if(string_char_at(line,j)="\t"){
				temp2++;
			}
			if(temp2=2 and string_char_at(line,j+1)="\t"){
				break;
			}
			if(temp2=2){
				description=string_insert(description,string_upper(string_char_at(line,j+1)),0);
			}
		}	
		if(description_input=description){
			num_index=7; //PART NUMBER CODE
			part_number="";
			temp=1;
			for(j=0;j<6;j++){
				part_number=string_insert(part_number,string_char_at(line,j+num_index),1); 
				if(string_char_at(line,j+num_index+1)="\t"){
					break;
				}  
				temp++;
			}
			for(j=temp+1;j<=(6);j++){
				part_number=string_insert(part_number,"0",j);
			}
			location_index=1; //BIN LOCATION CODE
			bin_location="";
			for(j=0;j<=4;j++){
				bin_location=string_insert(bin_location,string_char_at(line,j+location_index),0);
			}
			num_tabs=0; //QUANTITY CODE
			quantity="";
			for(j=0;j<=100;j++){
				if(string_char_at(line,j)="\t"){
					num_tabs++;
				}
				if(num_tabs=3){
					quantity=string_insert(quantity,string_char_at(line,j+1),0);
					if(string_char_at(line,j+2)="\t"){
						break;
					}
				}
			}
			global.description=description_input;
			global.part_number=part_number;
			global.bin_location=bin_location;
			global.quantity=quantity;
			room_goto(Room6);
		}
	}
}
file_text_close(f);  */
list=[];
file=file_text_open_read(working_directory+"\inventory_test.txt");
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

draw_text(500,310,list[1]);
draw_text(500,360,string_char_at(list[1],string_length(list[1])-1));
draw_text(500,410,string_char_at(list[1],string_length(list[1])));
units=""; //UNITS CODE
units=string_insert(units,string_char_at(list[1],string_length(list[1])-1),1);
units=string_insert(units,string_char_at(list[1],string_length(list[1])),1);
draw_text(500,460,units);

draw_text(500,260,"Hello World\\tMy Name is Liam.");
/*
units=""; //UNITS CODE
units=string_insert(units,string_char_at(line,-2),1);
units=string_insert(units,string_char_at(line,-1),1);