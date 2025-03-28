/// @description Insert description here
// You can write your code in this editor
global.num=0;
sprite_index=sprite_add(working_directory+"/Datafiles/no_image.JPG",0,0,0,0,0);

global.string="";
file=file_text_open_read(working_directory+"/Datafiles/image_number.txt");
global.string=file_text_read_string(file); //Column Titles
file_text_close(file);
















