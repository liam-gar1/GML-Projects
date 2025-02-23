/// @description Insert description here
// You can write your code in this editor
global.max++;
if (!global.up_arrow){
	instance_create_layer(130,205, "Instances", UpObj);
	global.up_arrow = true;
} /*
file=file_text_open_read(working_directory+"/image_number.txt");
line=file_text_read_string(file); //Column Titles
file_text_close(file);
draw_text(100,720,line);

if(global.max==real(line)-5){
	instance_destroy();
}




















