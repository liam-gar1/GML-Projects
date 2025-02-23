/// @description Insert description here
// You can write your code in this editor
global.resultsIndex--;
instance_destroy(DownObj);
instance_create_layer(736,512,"Instances_1",DownObj);
if(global.resultsIndex=1){
	instance_destroy();
}


