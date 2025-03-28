/// @description Insert description here
// You can write your code in this editor

file=file_text_open_read(working_directory+"/Datafiles/comparison_completed.txt");
line=file_text_read_string(file); //Column Titles
file_text_close(file);

//draw_set_color(c_black);
//draw_set_font(Font1);
//draw_text(400,500,line)

if(line==1){
	with(Loading){
		instance_destroy();
	}
	instance_create_layer(500,480,"Instances", Object21);
	//draw_sprite(Sprite17,0,500,480);
	draw_text(510,480,"Matches");
}
else if(line==0){
	with(Object21){
		instance_destroy();
		global.window=0;
	}
}

draw_set_color(c_black);
draw_set_font(Font1);
//draw_text(400,650,string(global.window));












