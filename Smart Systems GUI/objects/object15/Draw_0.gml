/// @description Insert description here
// You can write your code in this editor
file = file_text_open_write(working_directory + "Date.txt");
file_text_write_string(file,string(global.index+1)+"/"+global.day);
file_text_close(file);















