/// @description Insert description here
// You can write your code in this editor

file=file_text_open_read(working_directory+"/Datafiles/comparison_completed.txt");
line=file_text_read_string(file); //Column Titles
file_text_close(file);

instance_create_layer(500,480,"Instances",Loading);

file1 = file_text_open_write(working_directory+"/Datafiles/database_activation.txt");
file_text_write_string(file1,"1");
file_text_close(file1);














