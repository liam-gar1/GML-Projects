/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font1);
draw_set_color(c_black);
draw_text(50,50,"Search");
draw_text(50,100,"\nImage List");

global.string="";
file=file_text_open_read(working_directory+"/image_number.txt");
global.string=file_text_read_string(file); //Column Titles
file_text_close(file);

if(real(global.string)==0){
	draw_set_font(Font1);
	draw_set_color(c_gray);
	draw_text(50,195,"\nNo images.")
}












