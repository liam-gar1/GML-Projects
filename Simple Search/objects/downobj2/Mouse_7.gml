/// @description Insert description here
// You can write your code in this editor
global.resultsIndex++;
instance_destroy(UpObj);
instance_create_depth(736,288,-10,UpObj)
if(global.resultsIndex+2=global.list_length){
	instance_destroy();
}

