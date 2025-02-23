/// @description Insert description here
// You can write your code in this editor
delete_timer=0;
date="";
global.time=0;
global.timer_s=0;
global.timer_m=0;
global.n=0;
global.print=0;
global.msg="";
//global.index=0;
file=file_text_open_write(working_directory+"/Load.txt");
file_text_write_string(file,"..."); //Column Titles
file_text_close(file); 

global.Load="";
draw_set_font(Font4);
file=file_text_open_read(working_directory+"/Arduino.txt");
global.Load=file_text_read_string(file); //Column Titles	
file_text_readln(file);	
file_text_close(file);
/*
file=file_text_open_append(working_directory+"/Load.txt");
file_text_write_string(file,"\n"+string(global.Load)); //Column Titles
file_text_close(file); */


