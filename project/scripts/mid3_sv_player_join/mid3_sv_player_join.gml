var _remote_ip = argument[0]
var _remote_port = argument[1]

with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,3)
	
	var _list = ds_list_write(server.player_list)
	buffer_write(send_buffer,buffer_string,_list)
	
	buffer_write(send_buffer,buffer_u32,ds_list_find_index(server.ip_list,_remote_ip))
	
	ds_list_add(debug.log,"server - mids3 contents ID: "+string(ds_list_find_index(server.ip_list,_remote_ip)))

	network_send_udp(server.socket,_remote_ip,_remote_port,send_buffer,buffer_tell(send_buffer))
	log_buffer_sent(3)
}	