/// @description Insert description here
// You can write your code in this editor
global.max=0;
global.down_arrow= false;
global.up_arrow=false;
global.test=false;
global.index=1;
global.window=0;
global.database_index=0;
global.right_arrow=false;
global.left_arrow=false;

file = file_text_open_write(working_directory+"/Datafiles/database_activation.txt");
file_text_write_string(file,"0");
file_text_close(file);

file1 = file_text_open_write(working_directory+"/Datafiles/comparison_completed.txt");
file_text_write_string(file1,"0");
file_text_close(file1);

room_goto(Room3);




















