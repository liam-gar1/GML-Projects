/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(Font2);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(x,y,string_upper("Blank manually updated quantity to blank."));
draw_text(x,y,string_upper("\n\n\nBlank signed out blank units."));
draw_text(x,y,string_upper("\n\n\n\n\n\nBlank manually updated quantity to blank."));
draw_text(x,y,string_upper("\n\n\n\n\n\n\n\n\nBlank signed out blank units."));
draw_text(x,y,string_upper("\n\n\n\n\n\n\n\n\n\n\n\nBlank corrected quantity to blank."));
temp_minute=date_get_minute(date_current_datetime());
hour=date_get_hour(date_current_datetime());
month=string(date_get_month(date_current_datetime()));
day=string(date_get_day(date_current_datetime()));
year=string(date_get_year(date_current_datetime()));
if(temp_minute<10){
	minute="0"+string(temp_minute);
}
if(temp_minute>10){
	minute=string(date_get_minute(date_current_datetime()));
}
if(month=8){
	month=string("August");
}
if(hour<12){
	period="AM";
	hour=string(hour);
}
if(hour>=12){
	period="PM"
	if(hour>12){
		hour=string(hour-12);
	}
}
draw_text(x,y,string_upper("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"+month+" "+day+", "+year+" ("+hour+":"+minute+" "+period+") - Blank signed out blank units."));

/*
for(i=0;i<=global.list_length-1;i++){
	draw_text(0,390+50*i,string(global.descResultsOrder[i])+", "+string(global.sorted_part_num[i])+", "+string(global.sorted_results[i]));
}