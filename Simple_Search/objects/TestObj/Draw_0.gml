/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(Font2);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
/*for(i=0;i<=global.list_length-1;i++){
	draw_text(0,390+50*i,string(global.descResultsOrder[i])+", "+string(global.sorted_part_num[i])+", "+string(global.sorted_results[i]));
} */
if file_exists(working_directory+"/Photos/A000001.JPG"){
	draw_text(200,390,"Found");
}
if !file_exists(working_directory+"/Photos/A000001.JPG"){
	draw_text(200,440,"Not Found");
}
if !file_exists(working_directory+"/Photos/083037.JPG"){
	draw_text(200,490,"Not Found");
}
if file_exists(working_directory+"/Photos/083037.JPG"){
	draw_text(200,540,"Found");
}

//draw_text(0,390,"Hello World. \\tMy Name is Liam.");