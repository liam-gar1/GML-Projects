/// @description Insert description here
// You can write your code in this editor
global.i++;
global.time++;
instance_destroy(Object7);
instance_destroy(Object6);
if(global.time<24){
	instance_create_layer(226,96,"Instances",Object6);
	instance_create_layer(802,96,"Instances",Object7);
}
