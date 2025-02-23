/// @description Insert description here
// You can write your code in this editor
if(mytime>-1){
	mytime=mytime+(delta_time/1000000);
}
else mytime=0;
global.showtime=(ceil(mytime)-1)-global.min*60;

if(half_sec>-1){
	half_sec=half_sec+2*(delta_time/1000000);
}
else half_sec=0;
global.half_sec=(ceil(half_sec)-1);











