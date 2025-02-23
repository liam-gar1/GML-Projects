/// @description Insert description here
// You can write your code in this editor
global.timer_s++;
instance_destroy(Object8);
instance_destroy(Object9);
if(global.timer_s<10){
	draw_text(1250,50,"00:0"+global.timer_s);
}
else if(global.timer_s>9){
	draw_text(1250,50,"00:"+global.timer_s);
}
if(global.timer_s>59){
	global.timer_s=0;
	global.timer_m++;
}












