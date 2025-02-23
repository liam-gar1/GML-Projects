/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_gray);
draw_rectangle(100,56,1266,712,false);

file=file_text_open_read(working_directory+"/match_quantity.txt");
quantity=file_text_read_string(file); //Column Titles
file_text_close(file);

/*if(real(quantity)>1){
	if (!global.right_arrow){
		right_arrow=instance_create_layer(720,340,"Instances",RightObj);
		right_arrow.depth=-3;
		global.right_arrow = true;
	}
} */

if(global.database_index==real(quantity)-1){
	with(RightObj){
		instance_destroy();
	}
	global.right_arrow=false;
}
else if(real(quantity)>1){
	if (!global.right_arrow){
		right_arrow=instance_create_layer(720,340,"Instances",RightObj);
		right_arrow.depth=-3;
		global.right_arrow = true;
	}
}

if(global.database_index>0){
	if (!global.left_arrow){
		left_arrow=instance_create_layer(170,340,"Instances",LeftObj);
		left_arrow.depth=-3;
		global.left_arrow = true;
	}
}
if(global.database_index==0){
	with(LeftObj){
		instance_destroy();
	}
	global.left_arrow=false;
}

file=file_text_open_read(working_directory+"/file_names.txt");
for(i=0;i<=global.database_index;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);
}
file_text_close(file);

//draw_sprite(sprite_add("C:/Users/user/Desktop/Random/Apps/Slim Scope/Database/"+line+"/"+line,0,0,0,0,0),0,205,185);
draw_sprite(sprite_add("C:/Users/user/Desktop/Random/Apps/Slim Scope/Database/"+line,0,0,0,0,0),0,205,185);

file=file_text_open_read(working_directory+"/display_names.txt");
for(i=0;i<=global.database_index;i++){
	line=file_text_read_string(file); //Column Titles
	if(i==0 and line=="Escherichia Coli"){
		file1 = file_text_open_write(working_directory+"/bacterial.txt");
		file_text_write_string(file1,"1");
		file_text_close(file1);
	}
	file_text_readln(file);
}
file_text_close(file);

draw_set_color(c_white);
draw_set_font(Font2);
draw_text(750,200,"Microorganism: "+line);

file=file_text_open_read(working_directory+"/confidence.txt");
for(i=0;i<=global.database_index;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);
}
file_text_close(file);

draw_text(750,200,"\nConfidence: "+line+"%");
draw_set_font(Font1);
//draw_text(750,300,global.database_index);

file=file_text_open_read(working_directory+"/bacterial.txt");
line=file_text_read_string(file); //Column Titles
file_text_close(file);

if(real(line)==1){
	instance_create_layer(1250,370,"Instances",RightObj3);
}



















































































