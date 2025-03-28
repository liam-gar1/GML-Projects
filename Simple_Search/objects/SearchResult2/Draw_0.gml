/// @description Insert description here
// You can write your code in this editor
text=string(global.part_search_results[global.resultsIndex+2])+", "+string(global.description_search_results[global.resultsIndex+2]);
draw_set_color(c_white);
draw_set_font(Font2);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text(736,390,text);

