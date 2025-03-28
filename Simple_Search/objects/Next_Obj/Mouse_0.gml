/// @description Insert description here
// You can write your code in this editor
//object_set_sprite(Next_Obj,Next_Button2);
//object_set_sprite(Back_Obj,Back_Button2);
//object_set_sprite(Glove_Obj,Glove_Bin);

sprite_index=Next_Button2;
with Back_Obj{
	sprite_index=Back_Button2;
} 
with Item{
	//sprite_index=sprite_add(working_directory+"/Photos1/"+global.part_number+"B.JPG",0,0,0,0,0);
	sprite_index=sprite_add(working_directory+"/Photos/"+global.part_number+"B.JPG",0,0,0,0,0);
}