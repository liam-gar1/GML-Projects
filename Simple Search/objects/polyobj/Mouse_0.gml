/// @description Insert description here
// You can write your code in this editor
with(TestInput6_2){
	text4="POLY 400";
	global.cost_centre_label="POLY 400";
}
instance_create_layer(128,576,"Instances",TestBack1);
instance_destroy(TestBack2);
instance_create_depth(1088,576,-30,TestNext2);
instance_destroy(CostCentreGUIObj);
instance_destroy(CloseObj);
instance_destroy(FinishingObj);
instance_destroy(MaintObj);
instance_destroy(NylonObj);
instance_destroy(SiteServicesObj);
instance_destroy(ConvertingObj);
instance_destroy();