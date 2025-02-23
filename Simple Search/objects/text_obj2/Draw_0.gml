/// @description Insert description here
// You can write your code in this editor
//text=string("DESCRIPTION: GLOVES\nPART NUMBER: 000001\nBIN LOCATION: 09P58\nQUANTITY: 2");
//text2=string("DESCRIPTION: GLOVES\nPART NUMBER: "+global.part_number+"\nBIN LOCATION: 09P58\nQUANTITY: 2");
text=string("DESCRIPTION: "+global.description+"\nPART NUMBER: "+global.part_number+"\nBIN LOCATION: "+string(global.bin_location)+"\nQUANTITY: "+global.quantity+" "+global.units);
draw_set_color(c_white);
draw_set_font(Font2);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(x,y,text);