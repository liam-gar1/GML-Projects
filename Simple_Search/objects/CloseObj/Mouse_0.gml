with(TestInput6_2){
	if(text4="POLY" or text4="400" or text4="POLY 400" or text4="FINISHING" or text4="403" or text4="FINISHING 403" or text4="MAINT" or text4="419" or text4="MAINT 419" or text4="NYLON" or text4="402" or text4="NYLON 402" or text4="SITE SERVICES" or text4="411" or text4="SITE SERVICES 411" or text4="CONVERTING" or text4="000" or text4="CONVERTING 000"){
		global.cost_centre=text4;
		instance_create_depth(1088,576,-30,TestNext2);
		if(text4="POLY" or text4="400" or text4="POLY 400"){
			global.cost_centre_label="POLY 400";
		}
		if(text4="FINISHING" or text4="403" or text4="FINISHING 403"){
			global.cost_centre_label="FINISHING 403";
		}
		if(text4="MAINT" or text4="419" or text4="MAINT 419"){
			global.cost_centre_label="MAINT 419"
		}
		if(text4="NYLON" or text4="402" or text4="NYLON 402"){
			global.cost_centre_label="NYLON 402";
		}
		if(text4="SITE SERVICES" or text4="411" or text4="SITE SERVICES 411"){
			global.cost_centre_label="SITE SERVICES 411";
		}
		if(text4="CONVERTING" or text4="000" or text4="CONVERTING 000"){
			global.cost_centre_label="CONVERTING 000";
		}
	}
}
instance_create_layer(128,576,"Instances",TestBack1);
instance_destroy(TestBack2);
instance_destroy(CostCentreGUIObj);
instance_destroy(PolyObj);
instance_destroy(FinishingObj);
instance_destroy(MaintObj);
instance_destroy(NylonObj);
instance_destroy(SiteServicesObj);
instance_destroy(ConvertingObj);
instance_destroy();
