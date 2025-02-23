/// @description Insert description here
// You can write your code in this editor
text4=string("CONFIRM SIGN OUT FOR: "+string(real(global.sign_out_quantity))+" "+global.units+" ("+global.description+")\nTO: "+global.cost_centre_label+"\nBY: "+global.name);
draw_set_color(c_white);
draw_set_font(Font1);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text(x,y,text4);