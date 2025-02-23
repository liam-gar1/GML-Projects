/// @description Insert description here
// You can write your code in this editor
if (!global.test){
	instance_create_layer(300, 300, "Instances", TestObj);
	instance_create_layer(500,375,"Instances",Object18);
	global.test = true;
}
file = file_text_open_write(working_directory+"/display_image_name.txt");
file_text_write_string(file,global.second);
file_text_close(file);
global.index=2;

file = file_text_open_write(working_directory+"/comparison_completed.txt");
file_text_write_string(file,"0");
file_text_close(file);

file = file_text_open_write(working_directory+"/bacterial.txt");
file_text_write_string(file,"0");
file_text_close(file);
















