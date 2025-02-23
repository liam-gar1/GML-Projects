/// @description Insert description here
// You can write your code in this editor
port=64198;
//port=53755;
max_clients=4;
network_create_server(network_socket_tcp,port,max_clients);
server_buffer=buffer_create(1024,buffer_fixed,1);
socket_list=ds_list_create();














