/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var file;
file=file_text_open_write(working_directory+"/Files/time.txt");
file_text_write_string(file,string(current_second));
file_text_close(file);

var file;
file=file_text_open_read(working_directory+"/Files/time.txt");
second=file_text_read_string(file);
file_text_readln(file);
file_text_close(file);

draw_text(500,500,string(current_second-second));
