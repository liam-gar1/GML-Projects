/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(global.showtime=60){
	global.min++;
}
if(global.showtime<10){
	draw_text(1250,50,string(global.min)+":0"+string(global.showtime));
}
else if(global.showtime>9){
	draw_text(1250,50,string(global.min)+":"+string(global.showtime));
}


//draw_text(700,100,"Time left: "+string(global.showtime));
//draw_text(700,200,string(global.min));
//draw_text(700,300,string(global.half_sec));









