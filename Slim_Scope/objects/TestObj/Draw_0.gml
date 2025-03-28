/// @description Insert description here
// You can write your code in this editor
draw_set_font(c_black);
if(global.index=1){
	file=file_text_open_read(working_directory+"/Datafiles/display_image_name.txt");
	line=file_text_read_string(file); //Column Titles
	file_text_close(file);
	draw_text(920,600,line);
	draw_set_color(c_green)
	draw_set_font(Font1);
	draw_text(510,375,"Analysis");
	draw_sprite(sprite_add(working_directory+"/Datafiles/Resized Captures/"+line,0,0,0,0,0),0,735,210);
}
if(global.index=2){
	//draw_text(600,300,global.second);
	file=file_text_open_read(working_directory+"/Datafiles/display_image_name.txt");
	line=file_text_read_string(file); //Column Titles
	file_text_close(file);
	draw_text(920,600,line);
	draw_set_color(c_green)
	draw_set_font(Font1);
	draw_text(510,375,"Analysis");
	draw_sprite(sprite_add(working_directory+"/Datafiles/Resized Captures/"+line,0,0,0,0,0),0,735,210);
}
if(global.index=3){
	//draw_text(600,300,global.third);
	file=file_text_open_read(working_directory+"/Datafiles/display_image_name.txt");
	line=file_text_read_string(file); //Column Titles
	file_text_close(file);
	draw_text(920,600,line);
	draw_set_color(c_green)
	draw_set_font(Font1);
	draw_text(510,375,"Analysis");
	draw_sprite(sprite_add(working_directory+"/Datafiles/Resized Captures/"+line,0,0,0,0,0),0,735,210);
}
if(global.index=4){
	//draw_text(600,300,global.fourth);
	file=file_text_open_read(working_directory+"/Datafiles/display_image_name.txt");
	line=file_text_read_string(file); //Column Titles
	file_text_close(file);
	draw_text(920,600,line);
	draw_set_color(c_green)
	draw_set_font(Font1);
	draw_text(510,375,"Analysis");
	draw_sprite(sprite_add(working_directory+"/Datafiles/Resized Captures/"+line,0,0,0,0,0),0,735,210);
}
if(global.index=5){
	//draw_text(600,300,global.fifth);
	file=file_text_open_read(working_directory+"/Datafiles/display_image_name.txt");
	line=file_text_read_string(file); //Column Titles
	file_text_close(file);
	draw_text(920,600,line);
	draw_set_color(c_green)
	draw_set_font(Font1);
	draw_text(510,375,"Analysis");
	draw_sprite(sprite_add(working_directory+"/Datafiles/Resized Captures/"+line,0,0,0,0,0),0,735,210);
}

















