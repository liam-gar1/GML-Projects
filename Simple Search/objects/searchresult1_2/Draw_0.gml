/// @description Insert description here
// You can write your code in this editor
text=string(global.sorted_part_num[global.resultsIndex])+", "+string(global.sorted_results[global.resultsIndex]);
draw_set_color(c_white);
draw_set_font(Font2);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text(736,336,text);