/// @description Insert description here
// You can write your code in this editor
//if file_exists(working_directory+"/Photos1/"+global.part_number+"A.JPG"){
if file_exists(working_directory+"/Photos/"+global.part_number+"A.JPG"){
	//sprite_index=sprite_add(working_directory+"/Photos1/"+global.part_number+"A.JPG",0,0,0,0,0);
	sprite_index=sprite_add(working_directory+"/Photos/"+global.part_number+"A.JPG",0,0,0,0,0);
}

//if file_exists(working_directory+"/Photos1/"+global.part_number+"B.JPG"){
if file_exists(working_directory+"/Photos/"+global.part_number+"B.JPG"){
	instance_create_layer(1222,288,"Instances_1",Next_Obj);
}

//if !file_exists(working_directory+"/Photos1/"+global.part_number+"A.JPG"){
if !file_exists(working_directory+"/Photos/"+global.part_number+"A.JPG"){
	//sprite_index=sprite_add(working_directory+"/Photos1/No_Image.JPG",0,0,0,0,0);
	sprite_index=sprite_add(working_directory+"/Photos/No_Image.JPG",0,0,0,0,0);
}