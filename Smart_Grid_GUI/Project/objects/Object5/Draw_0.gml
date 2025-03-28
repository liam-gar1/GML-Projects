/// @description Insert description here
// You can write your code in this editor
//draw_self();
draw_set_color(c_white);
draw_set_font(Font4);
draw_set_halign(fa_top);
draw_set_valign(fa_left);
//month_days=[0,31,59,90,120,151,181,212,243,273,304,334];
month_days=[31,28,31,30,31,30,31,31,30,31,30,31];
month_demand=["Demand_Jan","Demand_Feb","Demand_Mar","Demand_Apr","Demand_May","Demand_Jun","Demand_Jul","Demand_Aug","Demand_Sep","Demand_Oct","Demand_Nov","Demand_Dec"];
month_nuclear=["Nuclear_Jan","Nuclear_Feb","Nuclear_Mar","Nuclear_Apr","Nuclear_May","Nuclear_Jun","Nuclear_Jul","Nuclear_Aug","Nuclear_Sep","Nuclear_Oct","Nuclear_Nov","Nuclear_Dec"];
month_gas=["Gas_Jan","Gas_Feb","Gas_Mar","Gas_Apr","Gas_May","Gas_Jun","Gas_Jul","Gas_Aug","Gas_Sep","Gas_Oct","Gas_Nov","Gas_Dec"];
month_hydro=["Hydro_Jan","Hydro_Feb","Hydro_Mar","Hydro_Apr","Hydro_May","Hydro_Jun","Hydro_Jul","Hydro_Aug","Hydro_Sep","Hydro_Oct","Hydro_Nov","Hydro_Dec"];
month_solar=["Solar_Jan","Solar_Feb","Solar_Mar","Solar_Apr","Solar_May","Solar_Jun","Solar_Jul","Solar_Aug","Solar_Sep","Solar_Oct","Solar_Nov","Solar_Dec"];
month_wind=["Wind_Jan","Wind_Feb","Wind_Mar","Wind_Apr","Wind_May","Wind_Jun","Wind_Jul","Wind_Aug","Wind_Sep","Wind_Oct","Wind_Nov","Wind_Dec"];

Hours=[];
file=file_text_open_read(working_directory+"/Files/Hours.txt");
for(i=0;i<=25;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	Hours[i]=line;
}
file_text_close(file);

Demand=[];
file=file_text_open_read(working_directory+"/Files/Demand/"+string(month_demand[global.index])+".txt");
for(i=0;i<month_days[global.index]*24;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	Demand[i]=line;
}
file_text_close(file);

Nuclear=[];
Nuclear_Output_List=[];
Nuclear_Capacity_List=[];
Nuclear_CF_List=[];
file=file_text_open_read(working_directory+"/Files/Nuclear/"+string(month_nuclear[global.index])+".txt");
for(i=0;i<month_days[global.index]*24;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	Nuclear[i]=line;
	Nuclear_Output="";
	Nuclear_Capacity="";
	Nuclear_CF="";
	tab=0;
	for(j=0;j<50;j++){
		if(tab=2){
			Nuclear_CF=string_insert(Nuclear_CF,string_char_at(Nuclear[i],j+1),0);
			if(string_char_at(Nuclear[i],j+2)=" "){
				break;
			}
		}
		else if(tab=1){
			Nuclear_Capacity=string_insert(Nuclear_Capacity,string_char_at(Nuclear[i],j+1),0);
			if(string_char_at(Nuclear[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=0){
			Nuclear_Output=string_insert(Nuclear_Output,string_char_at(Nuclear[i],j+1),0);
			if(string_char_at(Nuclear[i],j+2)=" "){
				tab++;
				j++;
			}
		} 
	}
	Nuclear_Output_List[i]=Nuclear_Output;
	Nuclear_Capacity_List[i]=Nuclear_Capacity;
	Nuclear_CF_List[i]=Nuclear_CF; 
}
file_text_close(file);

Gas=[];
file=file_text_open_read(working_directory+"/Files/Gas/"+string(month_gas[global.index])+".txt");
for(i=0;i<month_days[global.index]*24;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	Gas[i]=line;
	Gas_Output="";
	Gas_Capacity="";
	Gas_CF="";
	tab=0;
	for(j=0;j<50;j++){
		if(tab=2){
			Gas_CF=string_insert(Gas_CF,string_char_at(Gas[i],j+1),0);
			if(string_char_at(Gas[i],j+2)=" "){
				break;
			}
		}
		else if(tab=1){
			Gas_Capacity=string_insert(Gas_Capacity,string_char_at(Gas[i],j+1),0);
			if(string_char_at(Gas[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=0){
			Gas_Output=string_insert(Gas_Output,string_char_at(Gas[i],j+1),0);
			if(string_char_at(Gas[i],j+2)=" "){
				tab++;
				j++;
			}
		} 
	}
	Gas_Output_List[i]=Gas_Output;
	Gas_Capacity_List[i]=Gas_Capacity;
	Gas_CF_List[i]=Gas_CF; 
}
file_text_close(file);

Hydro=[];
file=file_text_open_read(working_directory+"/Files/Hydro/"+string(month_hydro[global.index])+".txt");
for(i=0;i<month_days[global.index]*24;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	Hydro[i]=line;
	Hydro_Output="";
	Hydro_Capacity="";
	Hydro_CF="";
	tab=0;
	for(j=0;j<50;j++){
		if(tab=2){
			Hydro_CF=string_insert(Hydro_CF,string_char_at(Hydro[i],j+1),0);
			if(string_char_at(Hydro[i],j+2)=" "){
				break;
			}
		}
		else if(tab=1){
			Hydro_Capacity=string_insert(Hydro_Capacity,string_char_at(Hydro[i],j+1),0);
			if(string_char_at(Hydro[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=0){
			Hydro_Output=string_insert(Hydro_Output,string_char_at(Hydro[i],j+1),0);
			if(string_char_at(Hydro[i],j+2)=" "){
				tab++;
				j++;
			}
		} 
	}
	Hydro_Output_List[i]=Hydro_Output;
	Hydro_Capacity_List[i]=Hydro_Capacity;
	Hydro_CF_List[i]=Hydro_CF;
}
file_text_close(file);

Solar=[];
file=file_text_open_read(working_directory+"/Files/Solar/"+string(month_solar[global.index])+".txt");
for(i=0;i<month_days[global.index]*24;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	Solar[i]=line;
	Solar_Output="";
	Solar_Capacity="";
	Solar_CF="";
	tab=0;
	for(j=0;j<50;j++){
		if(tab=2){
			Solar_CF=string_insert(Solar_CF,string_char_at(Solar[i],j+1),0);
			if(string_char_at(Solar[i],j+2)=" "){
				break;
			}
		}
		else if(tab=1){
			Solar_Capacity=string_insert(Solar_Capacity,string_char_at(Solar[i],j+1),0);
			if(string_char_at(Solar[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=0){
			Solar_Output=string_insert(Solar_Output,string_char_at(Solar[i],j+1),0);
			if(string_char_at(Solar[i],j+2)=" "){
				tab++;
				j++;
			}
		} 
	}
	Solar_Output_List[i]=Solar_Output;
	Solar_Capacity_List[i]=Solar_Capacity;
	Solar_CF_List[i]=Solar_CF; 
}
file_text_close(file);

Wind=[];
file=file_text_open_read(working_directory+"/Files/Wind/"+string(month_wind[global.index])+".txt");
for(i=0;i<month_days[global.index]*24;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	Wind[i]=line;
	Wind_Output="";
	Wind_Capacity="";
	Wind_CF="";
	tab=0;
	for(j=0;j<50;j++){
		if(tab=2){
			Wind_CF=string_insert(Wind_CF,string_char_at(Wind[i],j+1),0);
			if(string_char_at(Wind[i],j+2)=" "){
				break;
			}
		}
		else if(tab=1){
			Wind_Capacity=string_insert(Wind_Capacity,string_char_at(Wind[i],j+1),0);
			if(string_char_at(Wind[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=0){
			Wind_Output=string_insert(Wind_Output,string_char_at(Wind[i],j+1),0);
			if(string_char_at(Wind[i],j+2)=" "){
				tab++;
				j++;
			}
		} 
	}
	Wind_Output_List[i]=Wind_Output;
	Wind_Capacity_List[i]=Wind_Capacity;
	Wind_CF_List[i]=Wind_CF; 
}
file_text_close(file);

index=(global.day-1)*24+global.i;
//draw_text(1200,300,index);
//draw_text(900,450,Nuclear[0]);
//draw_text(900,500,string_char_at(Nuclear[0],1));
//draw_text(900,530,string_char_at(Nuclear[0],2));
//draw_text(900,560,string_char_at(Nuclear[0],3));
//draw_text(900,590,string_char_at(Nuclear[0],4));
//draw_text(900,620,Nuclear_Output_List[index]); 
//draw_text(800,650,tab);
//draw_text(900,650,Nuclear_Capacity_List[index]); 
//draw_text(900,680,Nuclear_CF_List[index]);
if(global.i<=24){
	if(global.showtime=24){
		draw_text(1550,26,"24:00:00");
	}
	else{
		if(real(Hours[global.i])<10){
			draw_text(1550,26,"0"+Hours[global.i]+":00:00");
		}
		else if(real(Hours[global.i])>9){
			draw_text(1550,26,Hours[global.i]+":00:00");
		}
	}
}
offset1=-25;
offset=-70;
draw_set_color(c_white);
draw_rectangle(x,y+135,x+1200,y+180,false);
z=90;
draw_rectangle(x+1200,y+136+z,x+1776,y+178+z,false);
z=180;
draw_rectangle(x+1200,y+136+z,x+1776,y+178+z,false);
z=270;
draw_rectangle(x+1200,y+136+z,x+1776,y+178+z,false);

draw_set_color(c_gray);
draw_rectangle(x+1200,y+135,x+1776,y+180,false);
z=45;
draw_rectangle(x,y+136+z,x+1200,y+178+z,false);
z=135;
draw_rectangle(x,y+136+z,x+1200,y+178+z,false);
z=225;
draw_rectangle(x,y+136+z,x+1200,y+178+z,false);
z=360;
draw_set_color(c_white);
draw_rectangle(x,y+135+z,x+1200,y+180+z,false);
z=450;
draw_set_color(c_gray);
draw_rectangle(x,y+135+z,x+1200,y+178+z,false);
global.red_fac=1000;
draw_set_color(c_white);
draw_text(x,y,"DEMAND: "+string(Demand[index])+" MW\n"+"DEMAND: "+string(Demand[index]/global.red_fac)+" W");
draw_set_color(c_black);
draw_text(x,y,"\n\n\n                    OUTPUT                                        CAPACITY                                      CAPACITY FACTOR");
draw_set_color(c_white);
draw_text(x,y,"\n\n\n\n                    TRUE (MW)       SCALED (W)         TRUE (MW)        SCALED (W)");		
draw_text(x,y,"\n\n\n\n\nNUCLEAR:     "+"\nGAS:             "+"\nHYDRO:         "+"\nSOLAR:         "+"\nWIND:           ");
draw_text(x,y,"\n\n\n\n\n                    "+Nuclear_Output_List[index]+"\n                    "+Gas_Output_List[index]+"\n                    "+Hydro_Output_List[index]+"\n                    "+Solar_Output_List[index]+"\n                    "+Wind_Output_List[index]);
draw_text(x,y,"\n\n\n\n\n                                             "+string(Nuclear_Output_List[index]/global.red_fac)+"\n                                             "+string(Gas_Output_List[index]/global.red_fac)+"\n                                             "+string(Hydro_Output_List[index]/global.red_fac)+"\n                                             "+string(Solar_Output_List[index]/global.red_fac)+"\n                                             "+string(Wind_Output_List[index]/global.red_fac));
draw_text(x,y,"\n\n\n\n\n                                                                         "+Nuclear_Capacity_List[index]+"\n                                                                         "+Gas_Capacity_List[index]+"\n                                                                         "+Hydro_Capacity_List[index]+"\n                                                                         "+Solar_Capacity_List[index]+"\n                                                                         "+Wind_Capacity_List[index]);
draw_text(x,y,"\n\n\n\n\n                                                                                                   "+string(Nuclear_Capacity_List[index]/global.red_fac)+"\n                                                                                                   "+string(Gas_Capacity_List[index]/global.red_fac)+"\n                                                                                                   "+string(Hydro_Capacity_List[index]/global.red_fac)+"\n                                                                                                   "+string(Solar_Capacity_List[index]/global.red_fac)+"\n                                                                                                   "+string(Wind_Capacity_List[index]/global.red_fac));
draw_text(x,y,"\n\n\n\n\n                                                                                                                              "+Nuclear_CF_List[index]+"\n                                                                                                                              "+Gas_CF_List[index]+"\n                                                                                                                              "+Hydro_CF_List[index]+"\n                                                                                                                              "+Solar_CF_List[index]+"\n                                                                                                                              "+Wind_CF_List[index]);
draw_set_color(c_black);
draw_text(x,y,"\n\n\n\n\n\n\n\n\n\n\n LOAD MEASUREMENTS");
draw_set_color(c_ltgray);
draw_rectangle(offset+700,100,offset+1132,350,false);
draw_set_color(c_white);
draw_text(x,y,"\n\n\n\n\n\n\n\n\n\n\n\n PREDICTED                                 ACTUAL                                      DEVIATION");
draw_text(x,y,"\n\n\n\n\n\n\n\n\n\n\n\n\n TRUE (MW)       SCALED (W)       TRUE (MW)      SCALED (W)    ");
draw_set_color(c_red);
draw_set_font(Font2);
draw_text(520+offset1,100,"DEMAND");
draw_set_color(c_aqua);
draw_text(520+offset1,130,"NUCLEAR");
draw_set_color(c_lime);
draw_text(520+offset1,160,"GAS");
draw_set_color(c_teal);
draw_text(520+offset1,190,"HYDRO");
draw_set_color(c_yellow);
draw_text(520+offset1,220,"SOLAR");
draw_set_color(c_purple);
draw_text(520+offset1,250,"WIND");
draw_set_color(c_white);
draw_text_ext_transformed(638+offset,260,"POWER (MW)",10,300,1,1,90);
draw_text(905+offset,364,"HOUR");
draw_text(863+offset,70,"HISTORICAL DATA");
draw_set_font(Font3);
interval=18;
for(i=0;i<25;i++){
	draw_text(offset+697+interval*i,350,string(i));
}
for(i=1;i<=12;i++){
	draw_text(666+offset,342-i*20.83333,string(i*2000));
}
draw_set_colour(c_red);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Demand[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Demand[i]))/24000)*250)-(350-((real(Demand[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Demand[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
} 
n=0;
for(i=((global.day-1)*24);i<=index;i++){
	draw_set_colour(c_red);
	draw_circle(offset+700+interval*n,350-(real(Demand[i])/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-(real(Demand[i])/24000)*250,5,true);
	n++;
}
draw_set_colour(c_yellow);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Solar_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Solar_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
} 
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_yellow);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_purple);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
}
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_purple);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_lime);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
} 
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_lime);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_teal);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
} 
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_teal);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_aqua);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
}
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_aqua);
	draw_circle(offset+700+interval*n,350-(real(Nuclear_Output_List[i])/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-(real(Nuclear_Output_List[i])/24000)*250,5,true);
	n++;
}
offset=550;
draw_set_color(c_ltgray);
draw_rectangle(offset+700,100,offset+1132,350,false);
draw_set_color(c_white);
draw_set_font(Font2);
draw_text_ext_transformed(638+offset,260,"POWER (MW)",10,300,1,1,90);
draw_text(905+offset,364,"HOUR");
draw_text(863+offset,70,"REAL-TIME DATA");
draw_set_font(Font3);
interval=18;
for(i=0;i<25;i++){
	draw_text(offset+697+interval*i,350,string(i));
}
for(i=1;i<=12;i++){
	draw_text(666+offset,342-i*20.83333,string(i*2000));
} /*
draw_set_colour(c_red);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Demand[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Demand[i]))/24000)*250)-(350-((real(Demand[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Demand[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
}
n=0;
for(i=((global.day-1)*24);i<=index;i++){
	draw_set_colour(c_red);
	draw_circle(offset+700+interval*n,350-(real(Demand[i])/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-(real(Demand[i])/24000)*250,5,true);
	n++;
} */
draw_set_colour(c_yellow);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Solar_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Solar_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
} 
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_yellow);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Solar_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_purple);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1])+real(Wind_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
}
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_purple);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i])+real(Wind_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_lime);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Gas_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
} 
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_lime);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Gas_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_teal);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1])+real(Hydro_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
} 
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_teal);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Output_List[i])+real(Hydro_Output_List[i]))/24000)*250,5,true);
	n++;
}
draw_set_colour(c_aqua);
n=0;
interval=18;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	if(i=(global.day-1)*24){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Output_List[i]))/24000)*250));
	}
	else{
		rise=(350-((real(Nuclear_Output_List[i]))/24000)*250)-(350-((real(Nuclear_Output_List[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Output_List[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
	}
}
n=0;
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	draw_set_colour(c_aqua);
	draw_circle(offset+700+interval*n,350-(real(Nuclear_Output_List[i])/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-(real(Nuclear_Output_List[i])/24000)*250,5,true);
	n++;
}

draw_set_color(c_white);
draw_set_font(Font4);
draw_text(45,905,string(Demand[index]));
draw_text(218,905,string(Demand[index]/global.red_fac));

/*
file=file_text_open_read(working_directory+"/Client.txt");
Client=file_text_read_string(file); //Column Titles	
file_text_readln(file);	
file_text_close(file);

draw_text(400,905,Client); */
//draw_text(570,905,Client/global.red_fac);

draw_text(1320,y,"\n\n\nCAPACITY FACTOR RECALCULATIONS");
draw_set_font(Font2);
draw_text(1240,y+5+175,"NUCLEAR STATION 1");
//draw_text(1240,y+175,"\nNUCLEAR STATION 2");
draw_set_color(c_black);
draw_text(1240,y+5+175+45,"GAS STATION 1");
//draw_text(1240,y+175+45,"\nGAS STATION 2");
draw_set_color(c_white);
draw_text(1240,y+5+175+90,"HYDRO STATION 1");
draw_text(1240,y+175+90,"\nHYDRO STATION 2");
draw_set_color(c_black);
draw_text(1240,y+5+175+135,"SOLAR STATION 1");
draw_text(1240,y+175+135,"\nSOLAR STATION 2");
draw_set_color(c_white);
draw_text(1240,y+5+175+180,"WIND STATION 1");
draw_text(1240,y+175+180,"\nWIND STATION 2");
/*
file = file_text_open_write(working_directory + "Date.txt");
file_text_write_string(file,string(global.index+1)+"/"+global.day);
file_text_close(file);*/
instance_create_layer(1600,800,"Instances",Object15);

if(real(global.time)!=0){
	instance_destroy(Object15);
	file = file_text_open_write(working_directory + "/Files/Date.txt");
	file_text_write_string(file,"0");
	file_text_close(file);
}

global.Load="";
draw_set_font(Font4);
file=file_text_open_read(working_directory+"/Files/Arduino.txt");
global.Load=file_text_read_string(file); //Column Titles	
file_text_readln(file);	
file_text_close(file);
/*
file=file_text_open_append(working_directory+"/Load.txt");
file_text_write_string(file,"\n"+string(global.Load)); //Column Titles
file_text_close(file); */
if(global.Load!="..." and global.Load!=""){ 
	draw_text(400,905,string(global.Load));
	draw_text(570,905,string(real(global.Load)/1000));
	Deviation=(string(global.Load)/Demand[index]-1)*100;
	if(Deviation<0){
		draw_set_color(c_red);
		draw_text(760,905,string(Deviation)+"%");
	}
	else if(Deviation>0){
		draw_set_color(c_lime);
		draw_text(760,905,"+"+string(Deviation)+"%");
	}
	else if(Deviation==0){
		draw_set_color(c_white);
		draw_text(760,905,string(Deviation)+"%");
	}
}
else{
	draw_text(400,905,"...");
	draw_text(570,905,"...");
	draw_text(760,905,"...");
}

/*
draw_text(1500,800,string(global.i));
if(global.i==0){
	file=file_text_open_append(working_directory+"/Load.txt");
	file_text_write_string(file,"\n"+string(Load)); //Column Titles
	file_text_close(file);
	
}/*
if(global.i==1){
	file=file_text_open_append(working_directory+"/Load.txt");
	file_text_write_string(file,"\n"+string(Load)); //Column Titles
	file_text_close(file);
} */

/*
for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
	file_text_write_string(file,string(Load)+"\n");
}
file_text_close(file); 

LoadList=[];
file=file_text_open_read(working_directory+"/Load.txt");
for(i=0;i<month_days[global.index]*24;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);	
	LoadList[i]=line;
	//draw_text(1500,800,line);
}
file_text_close(file); */

file=file_text_open_read(working_directory+"/Files/Client.txt");
//for(i=(global.day-1)*24;i<=(global.day-1)*24+global.i;i++){
for(i=0;i<=global.i;i++){
	Client=file_text_read_string(file); //Column Titles	
	file_text_readln(file);
}
//}
file_text_close(file);
if(Client=="" or Client=="..."){
	
	offset3=300;
	draw_set_color(c_white);
	draw_set_font(Font2);
	
	draw_text(1240+offset3,y+5+175,"...");
	draw_set_color(c_black);
	draw_text(1240+offset3,y+5+175+45,"...");
	draw_set_color(c_white);
	draw_text(1240+offset3,y+5+175+90,"...");
	draw_text(1240+offset3,y+175+90,"\n"+"...");
	draw_set_color(c_black);
	draw_text(1240+offset3,y+5+175+135,"...");
	draw_text(1240+offset3,y+175+135,"\n"+"...");
	draw_set_color(c_white);
	draw_text(1240+offset3,y+5+175+180,"...");
	draw_text(1240+offset3,y+175+180,"\n"+"...");
}
else{
	Nuc_Cap="";
	Gas_Cap="";
	Hyd_Cap_1="";
	Hyd_Cap_2="";
	Sol_Cap_1="";
	Sol_Cap_2="";
	Win_Cap_1="";
	Win_Cap_2="";
	tab=0;
	for(j=0;j<400;j++){
		if(tab=7){
			Win_Cap_2=string_insert(Win_Cap_2,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				break;
			}
		}
		else if(tab=6){
			Win_Cap_1=string_insert(Win_Cap_1,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				tab++;
				j++;
			}
		}
		else if(tab=5){
			Sol_Cap_2=string_insert(Sol_Cap_2,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				tab++;
				j++;
			}
		}
		else if(tab=4){
			Sol_Cap_1=string_insert(Sol_Cap_1,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				tab++;
				j++;
			}
		}
		else if(tab=3){
			Hyd_Cap_2=string_insert(Hyd_Cap_2,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				tab++;
				j++;
			}
		}
		else if(tab=2){
			Hyd_Cap_1=string_insert(Hyd_Cap_1,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				tab++;
				j++;
			}
		}
		else if(tab=1){
			Gas_Cap=string_insert(Gas_Cap,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				tab++;
				j++;
			}
		}
		else if(tab=0){
			Nuc_Cap=string_insert(Nuc_Cap,string_char_at(Client,j+1),0);
			if(string_char_at(Client,j+2)=","){
				tab++;
				j++;
			}
		}
	}
	offset3=300;
	draw_set_color(c_white);
	draw_set_font(Font2);
	global.New_Nuc_CF=[]
	global.New_Gas_CF=[]
	global.New_Hyd_1_CF=[]
	global.New_Hyd_2_CF=[]
	global.New_Sol_1_CF=[]
	global.New_Sol_2_CF=[]
	global.New_Win_1_CF=[]
	global.New_Win_2_CF=[]
	if(global.Load!="..." and global.Load!=""){
		if(Nuc_Cap!=0){
			draw_text(1240+offset3,y+5+175,Nuclear_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Nuclear_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Nuc_CF[global.i]=string(real(Nuclear_CF_List[index])*(1+real(Deviation)/100))
		}
		else if(Nuc_Cap==0){
			draw_text(1240+offset3,y+5+175,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Nuc_CF[global.i]=string(0*(1+real(Deviation)/100));
		}
		draw_set_color(c_black);
		if(Gas_Cap!=0){
			draw_text(1240+offset3,y+5+175+45,Gas_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Gas_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Gas_CF[global.i]=string(real(Gas_CF_List[index])*(1+real(Deviation)/100));
		}
		else if(Gas_Cap==0){
			draw_text(1240+offset3,y+5+175+45,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Gas_CF[global.i]=string(real(Gas_CF_List[index])*(1+real(Deviation)/100));
		}
		draw_set_color(c_white);
		if(Hyd_Cap_1!=0){
			draw_text(1240+offset3,y+5+175+90,Hydro_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Hydro_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Hyd_1_CF[global.i]=string(real(Hydro_CF_List[index])*(1+real(Deviation)/100));
		}
		else if(Hyd_Cap_1==0){
			draw_text(1240+offset3,y+5+175+90,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Hyd_1_CF[global.i]=string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100));
		}
		if(Hyd_Cap_2!=0){
			draw_text(1240+offset3,y+175+90,"\n"+Hydro_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Hydro_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Hyd_2_CF[global.i]=string(real(Hydro_CF_List[index])*(1+real(Deviation)/100));
		}
		else if(Hyd_Cap_2==0){
			draw_text(1240+offset3,y+175+90,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Hyd_2_CF[global.i]=string(0*(1+real(Deviation)/100));
		}
		draw_set_color(c_black);
		if(Sol_Cap_1!=0){
			draw_text(1240+offset3,y+5+175+135,Solar_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Solar_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Sol_1_CF[global.i]=string(real(Solar_CF_List[index])*(1+real(Deviation)/100));
		}
		else if(Sol_Cap_1==0){
			draw_text(1240+offset3,y+5+175+135,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Sol_1_CF[global.i]=string(0*(1+real(Deviation)/100));
		}
		if(Sol_Cap_2!=0){
			draw_text(1240+offset3,y+175+135,"\n"+Solar_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Solar_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Sol_2_CF[global.i]=string(real(Solar_CF_List[index])*(1+real(Deviation)/100));
		}
		else if(Sol_Cap_2==0){
			draw_text(1240+offset3,y+175+135,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Sol_2_CF[global.i]=string(0*(1+real(Deviation)/100));
		}
		draw_set_color(c_white);
		if(Win_Cap_1!=0){
			draw_text(1240+offset3,y+5+175+180,Wind_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Wind_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Win_1_CF[global.i]=string(real(Wind_CF_List[index])*(1+real(Deviation)/100));
		}
		else if(Win_Cap_1==0){
			draw_text(1240+offset3,y+5+175+180,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Win_1_CF[global.i]=string(0*(1+real(Deviation)/100));
		}
		if(Win_Cap_2!=0){
			draw_text(1240+offset3,y+175+180,"\n"+Wind_CF_List[index]+"x"+string(1+Deviation/100)+"="+string(real(Wind_CF_List[index])*(1+real(Deviation)/100)));
			global.New_Win_2_CF[global.i]=string(real(Wind_CF_List[index])*(1+real(Deviation)/100));
		}
		else if(Win_Cap_2==0){
			draw_text(1240+offset3,y+175+180,"0"+"x"+string(1+Deviation/100)+"="+string(0*(1+real(Deviation)/100)));
			global.New_Win_2_CF[global.i]=string(0*(1+real(Deviation)/100));
		}
		//draw_text(1500,850,global.New_Nuc_CF[global.i]);
		file=file_text_open_write(working_directory+"/Files/Server.txt");
		file_text_write_string(file,string(global.New_Nuc_CF[global.i])+","+string(global.New_Gas_CF[global.i])+","+string(global.New_Hyd_1_CF[global.i])+","+string(global.New_Hyd_2_CF[global.i])+","+string(global.New_Sol_1_CF[global.i])+","+string(global.New_Sol_2_CF[global.i])+","+string(global.New_Win_1_CF[global.i])+","+string(global.New_Win_2_CF[global.i])); //Column Titles
		file_text_close(file); 
	}
	else{
		draw_text(1240+offset3,y+5+175,"...");
		draw_set_color(c_black);
		draw_text(1240+offset3,y+5+175+45,"...");
		draw_set_color(c_white);
		draw_text(1240+offset3,y+5+175+90,"...");
		draw_text(1240+offset3,y+175+90,"\n"+"...");
		draw_set_color(c_black);
		draw_text(1240+offset3,y+5+175+135,"...");
		draw_text(1240+offset3,y+175+135,"\n"+"...");
		draw_set_color(c_white);
		draw_text(1240+offset3,y+5+175+180,"...");
		draw_text(1240+offset3,y+175+180,"\n"+"...");
	}
} 
/*
file=file_text_open_append(working_directory+"/Load.txt");
file_text_write_string(file,"\n"+string(global.Load)); //Column Titles
file_text_close(file); */

Load=[];
file=file_text_open_read(working_directory+"/Files/Load.txt");
//file_text_read_string(file); //Column Titles	
//file_text_readln(file);
for(i=0;i<=global.i_2;i++){
	Load[i]=file_text_read_string(file); //Column Titles	
	file_text_readln(file);
}
file_text_close(file);

//draw_text(1550,700,Load[global.i]);
/*
file=file_text_open_read(working_directory+"/Date.txt");
line=file_text_read_string(file); //Column Titles	
file_text_readln(file);	
file_text_close(file);
draw_text(1600,800,string(line)); */

//if(Load[global.i]!="..." or Load[global.i]!=""){
draw_set_colour(c_red);
n=0;
interval=18;
for(i=0;i<=global.i_2;i++){
	if(i=1){
		if(Load[i]!="..."){
		draw_line(700+offset,350,700+offset,(350-((real(Load[i]))/24000)*250));
		}
	}
	else{
		if(Load[i]!="..." and Load[i]!="" and Load[i-1]!="..." and Load[i-1]!=""){
		rise=(350-((real(Load[i]))/24000)*250)-(350-((real(Load[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Load[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
		}
	}
}
n=0;
for(i=0;i<=global.i_2;i++){
	if(Load[i]!="..." and Load[i]!=""){
	draw_set_colour(c_red);
	draw_circle(offset+700+interval*n,350-(real(Load[i])/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-(real(Load[i])/24000)*250,5,true);
	n++;
	}
}
/*
OutputUpdate=[];
New_Nuc_Out=[];
New_Gas_Out=[];
New_Hyd_1_Out=[];
New_Hyd_2_Out=[];
New_Sol_1_Out=[];
New_Sol_2_Out=[];
New_Win_1_Out=[];
New_Win_2_Out=[];
file=file_text_open_read(working_directory+"/OutputUpdate.txt");
for(i=0;i<=global.i_2;i++){
	line=file_text_read_string(file); //Column Titles
	file_text_readln(file);
	if(line!="..." and line!=""){
	OutputUpdate[i]=line;
	Nuc_Out="";
	Gas_Out="";
	Hyd_1_Out="";
	Hyd_2_Out="";
	Sol_1_Out="";
	Sol_2_Out="";
	Win_1_Out="";
	Win_2_Out="";
	tab=0;
	for(j=0;j<50;j++){
		if(tab=7){
			Hyd_1_Out=string_insert(Hyd_1_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				break;
			}
		}
		else if(tab=6){
			Gas_Out=string_insert(New_Gas_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=5){
			Hyd_1_Out=string_insert(Hyd_1_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=4){
			Gas_Out=string_insert(New_Gas_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=3){
			Nuc_Out=string_insert(Nuc_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				tab++;
				j++;
			}
		} 
		else if(tab=2){
			Hyd_1_Out=string_insert(Hyd_1_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=1){
			Gas_Out=string_insert(New_Gas_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				tab++;
				j++;
			}
		}
		else if(tab=0){
			Nuc_Out=string_insert(Nuc_Out,string_char_at(OutputUpdate[i],j+1),0);
			if(string_char_at(OutputUpdate[i],j+2)=" "){
				tab++;
				j++;
			}
		} 
	}
	New_Nuc_Out[i]=Nuc_Out;
	New_Gas_Out[i]=Gas_Out;
	New_Hyd_1_Out[i]=Hyd_1_Out;
	New_Hyd_2_Out[i]=Hyd_2_Out;
	New_Sol_1_Out[i]=Sol_1_Out;
	New_Sol_2_Out[i]=Sol_2_Out;
	New_Win_1_Out[i]=Win_1_Out;
	New_Win_2_Out[i]=Win_2_Out;
	}
}
file_text_close(file);

draw_set_colour(c_yellow);
n=0;
interval=18;
for(i=0;i<=global.i_2;i++){
	if(i=1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Solar_Capacity_List[i]*New_Sol_1_Out[i]+Solar_Capacity_List[i]*New_Sol_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250));
		}
	}
	else if(i>0){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!="" and OutputUpdate[i-1]!="..." and OutputUpdate[i-1]!=""){
		rise=(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Solar_Capacity_List[i]*New_Sol_1_Out[i]+Solar_Capacity_List[i]*New_Sol_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250)-(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Gas_Capacity_List[i-1]*New_Gas_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1])+real(Solar_Capacity_List[i-1]*New_Sol_1_Out[i-1]+Solar_Capacity_List[i-1]*New_Sol_2_Out[i-1])+real(Wind_Capacity_List[i-1]*New_Win_1_Out[i-1]+Wind_Capacity_List[i-1]*New_Win_2_Out[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Gas_Capacity_List[i-1]*New_Gas_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1])+real(Solar_Capacity_List[i-1]*New_Sol_1_Out[i-1]+Solar_Capacity_List[i-1]*New_Sol_2_Out[i-1])+real(Wind_Capacity_List[i-1]*New_Win_1_Out[i-1]+Wind_Capacity_List[i-1]*New_Win_2_Out[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
		}
	}
} 
n=0;
for(i=0;i<=global.i_2;i++){
	if(i>0){
	if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){	
	draw_set_colour(c_yellow);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Solar_Capacity_List[i]*New_Sol_1_Out[i]+Solar_Capacity_List[i]*New_Sol_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Solar_Capacity_List[i]*New_Sol_1_Out[i]+Solar_Capacity_List[i]*New_Sol_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250,5,true);
	n++;
	}
	}
}
draw_set_colour(c_purple);
n=0;
interval=18;
for(i=0;i<=global.i_2;i++){
	if(i=1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250));
		}
	}
	else if(i>1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!="" and OutputUpdate[i-1]!="..." and OutputUpdate[i-1]!=""){
		rise=(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250)-(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Gas_Capacity_List[i-1]*New_Gas_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1])+real(Wind_Capacity_List[i-1]*New_Win_1_Out[i-1]+Wind_Capacity_List[i-1]*New_Win_2_Out[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Gas_Capacity_List[i-1]*New_Gas_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1])+real(Wind_Capacity_List[i-1]*New_Win_1_Out[i-1]+Wind_Capacity_List[i-1]*New_Win_2_Out[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
		}
	}
}
n=0;
for(i=0;i<=global.i_2;i++){
	if(i>0){
	if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){	
	draw_set_colour(c_purple);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i])+real(Wind_Capacity_List[i]*New_Win_1_Out[i]+Wind_Capacity_List[i]*New_Win_2_Out[i]))/24000)*250,5,true);
	n++;
	}
	}
}
draw_set_colour(c_lime);
n=0;
interval=18;
for(i=0;i<=global.i_2;i++){
	if(i=1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250));
		}
	}
	else if(i>1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!="" and OutputUpdate[i-1]!="..." and OutputUpdate[i-1]!=""){
		rise=(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250)-(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Gas_Capacity_List[i-1]*New_Gas_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Gas_Capacity_List[i-1]*New_Gas_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
		}
	}
} 
n=0;
for(i=0;i<=global.i_2;i++){
	if(i>0){
	if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){	
	draw_set_colour(c_lime);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Gas_Capacity_List[i]*New_Gas_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250,5,true);
	n++;
	}
	}
}
draw_set_colour(c_teal);
n=0;
interval=18;
for(i=0;i<=global.i_2;i++){
	if(i=1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250));
		}
	}
	else if(i>1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!="" and OutputUpdate[i-1]!="..." and OutputUpdate[i-1]!=""){
		rise=(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250)-(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1])+real(Hydro_Capacity_List[i-1]*New_Hyd_1_Out[i-1]+Hydro_Capacity_List[i-1]*New_Hyd_2_Out[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
		}
	}
} 
n=0;
for(i=0;i<=global.i_2;i++){
	if(i>0){
	if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){	
	draw_set_colour(c_teal);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])+real(Hydro_Capacity_List[i]*New_Hyd_1_Out[i]+Hydro_Capacity_List[i]*New_Hyd_2_Out[i]))/24000)*250,5,true);
	n++;
	}
	}
}
draw_set_colour(c_aqua);
n=0;
interval=18;
for(i=0;i<=global.i_2;i++){
	if(i=1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){
		draw_line(700+offset,350,700+offset,(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i]))/24000)*250));
		}
	}
	else if(i>1){
		if(OutputUpdate[i]!="..." and OutputUpdate[i]!="" and OutputUpdate[i-1]!="..." and OutputUpdate[i-1]!=""){
		rise=(350-((real(Nuclear_Capacity_List[i]*New_Nuc_Out[i]))/24000)*250)-(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1]))/24000)*250);
		m=rise/interval;
		b=(350-((real(Nuclear_Capacity_List[i-1]*New_Nuc_Out[i-1]))/24000)*250)-n*rise;
		for(j=n*interval;j<=(n+1)*interval;j++){
			draw_line(700+offset+j,350,700+offset+j,m*j+b);
		}
		n++;
		}
	}
}
n=0;
for(i=0;i<=global.i_2;i++){
	if(i>0){
	if(OutputUpdate[i]!="..." and OutputUpdate[i]!=""){	
	draw_set_colour(c_aqua);
	draw_circle(offset+700+interval*n,350-(real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])/24000)*250,5,false);
	draw_set_colour(c_white);
	draw_circle(offset+700+interval*n,350-(real(Nuclear_Capacity_List[i]*New_Nuc_Out[i])/24000)*250,5,true);
	n++;
	}
	}
}