/// @description Insert description here
// You can write your code in this editor
//draw_self();
draw_set_color(c_white);
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x,y,global.month+"\n"+string(string_length(global.date))+"\n"+string(global.day)+"\n"+string(global.date)+"\n"+string_char_at(global.date,string_length(global.date))+string_char_at(global.date,string_length(global.date)-1));
//draw_text(x,y,global.month+"\n"+global.day);










