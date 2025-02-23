/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_font(Font4);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var file;
file=file_text_open_read(working_directory+"/time.txt");
second=file_text_read_string(file);
file_text_readln(file);
file_text_close(file);
if(real(current_second)=0){
	global.n++;
	global.n--;
	global.n--;
}

draw_text(1580,150,string(global.n));

if((global.n*60+current_second-real(second))<10){
	draw_text(1780,46,"00:0"+string(global.n*60+current_second-second));
}
else if((global.n*60+current_second-real(second))>9){
	draw_text(1780,46,"00:"+string(global.n*60+current_second-second));
}

/*
/*else if(global.timer_s>9){
	draw_text(1250,50,"00:"+string(current_time-second));
}
/*
draw_set_color(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(global.timer_s<10){
	draw_text(1250,50,"00:0"+string(global.timer_s));
}
else if(global.timer_s>9){
	draw_text(1250,50,"00:"+string(global.timer_s));
}/*
if(global.timer_s>59){
	global.timer_s=0;
	global.timer_m++;
}













