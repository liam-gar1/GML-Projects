// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function received_packet(){
	buffer=argument0;
	socket=argument1;
	msgid=buffer_read(buffer,buffer_u8);
	switch(msgid)
	{
		case 1:
			global.msg=string(buffer_read(buffer,buffer_string));
			global.print=1;
			//var message=buffer_read(buffer,buffer_string);
			//show_message(message);
			break;
	}
}