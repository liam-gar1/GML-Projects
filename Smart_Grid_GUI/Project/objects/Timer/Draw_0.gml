/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(Font4);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
factor=2; //1 second
n=0.5*factor;
if(global.showtime=60){
	global.min++;
}
if(global.showtime<10 and global.min*60+global.showtime<=n*24){
	draw_text(1780,46,string(global.min)+":0"+string(global.showtime));
}
else if(global.showtime>9 and global.min*60+global.showtime<=n*24){
	draw_text(1780,46,string(global.min)+":"+string(global.showtime));
}
else{
	global.showtime=12*factor;
	global.half_sec=0;
	draw_text(1780,46,"0:"+string(global.showtime));
}

if(global.half_sec=(global.time+1)*2*n and global.i<23){
	global.time++;
	global.i++;
	global.i_2++;
	file=file_text_open_append(working_directory+"/Files/Load.txt");
	file_text_write_string(file,"\n"+string(global.Load)); //Column Titles
	file_text_close(file); 
}
else if(global.half_sec=(global.time+1)*2*n and global.i<24){
	global.i_2++;
	file=file_text_open_append(working_directory+"/Files/Load.txt");
	file_text_write_string(file,"\n"+string(global.Load)); //Column Titles
	file_text_close(file); 
}
/*
n=12.5
2*n

2*n*24

global.min*60+global.showtime<=n*24









