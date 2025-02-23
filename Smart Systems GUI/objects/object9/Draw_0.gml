/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(Font4);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(global.time<10){
	draw_text(1550,46,"0"+string(global.time)+":00:00");
}
else if(global.time>9){
	draw_text(1550,46,string(global.time)+":00:00");
}














