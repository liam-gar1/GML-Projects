/// @description Insert description here
// You can write your code in this editor

file=file_text_open_read(working_directory+"/image_number.txt");
line=file_text_read_string(file); //Column Titles
file_text_close(file);
draw_text(x-100,y+100,line);
draw_text(x-100,y+120,global.string);

draw_text(x-100,y+350,"C:/Users/user/Desktop/Random/Apps/Slim Scope/Captures/image"+line+".JPG");

if (file_exists("C:/Users/user/Desktop/Random/Apps/Slim Scope/Captures/image"+string(real(global.string)+1)+".JPG")) {
	draw_text(x-100,y+375,"Success");
	instance_create_layer(x,y,"Instances",Object3);
}

//with(Object1){
	
//}
















