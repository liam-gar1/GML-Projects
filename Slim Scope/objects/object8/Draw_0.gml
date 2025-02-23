/// @description Insert description here
// You can write your code in this editor
global.arrow=0;

draw_set_font(Font1);
search_path = "C:/Users/user/Desktop/Random/Apps/Slim Scope/Icons/*.jpg";

search_handle = file_find_first(search_path, 0);
for(i=0;i<6;i++){
	if(string_length(search_handle)>0 and i<5){
		search_handle=file_find_next();
	}
	else if(string_length(search_handle)>0 and i>4){
		global.arrow=1;
		if (!global.down_arrow){
			instance_create_layer(130, 712, "Instances", DownObj);
			global.down_arrow = true;
		}
		search_handle=file_find_next();
		break;
	}
}

top="";
top=file_find_first(search_path,0);
search_handle = file_find_first(search_path, 0);
for(i=0;i<global.max;i++){
	search_handle=file_find_next();
}
global.first="";
global.second="";
global.third="";
global.fourth="";
global.fifth="";
for(i=0;i<5;i++){
	if(string_length(search_handle)>0){
		draw_text(150,245+i*100,search_handle);
		draw_sprite(sprite_add("C:/Users/user/Desktop/Random/Apps/Slim Scope/Icons/"+search_handle,0,0,0,0,0),0,50,240+i*100);
		if(i==0){
			instance_create_layer(50,240+i*100,"Instances",Object12);
			global.first=search_handle;
		}
		if(i==1){
			instance_create_layer(50,240+i*100,"Instances",Object13);
			global.second=search_handle;
		}
		if(i==2){
			instance_create_layer(50,240+i*100,"Instances",Object14);
			global.third=search_handle;
		}
		if(i==3){
			instance_create_layer(50,240+i*100,"Instances",Object15);
			global.fourth=search_handle;
		}
		if(i==4){
			instance_create_layer(50,240+i*100,"Instances",Object16);
			global.fifth=search_handle;
		}
		search_handle=file_find_next();
	}
	else{
		break;
	}
}

file=file_text_open_read(working_directory+"/image_number.txt");
line=file_text_read_string(file); //Column Titles
file_text_close(file);

if(global.max==real(line)-5){
	with(DownObj){
		instance_destroy();
	}
	global.down_arrow=false;
}

if(global.max==0){
	with(UpObj){
		instance_destroy();
	}
	global.up_arrow=false;
}
/*
if(global.max==5){
	with(UpObj){
		instance_destroy();
	}
	global.up_arrow=false;
}

/*
for(i=1;i<global.number;i++){
	draw_sprite(sprite_add("C:/Users/user/Desktop/Random/Apps/Slim Scope/Icons/"+search_handle,0,0,0,0,0),0,50,240+i*100);
}

















