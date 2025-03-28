draw_set_color(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
file=file_text_open_read(working_directory+"/Files/Arduino.txt");
line=file_text_read_string(file); //Column Titles	
file_text_readln(file);	
file_text_close(file);
draw_text(x,y,"Arduino communication: "+string(line));













