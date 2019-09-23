var _ip = argument[0]
var _port = argument[1]

with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,1)
	buffer_write(send_buffer,buffer_u32,ds_list_size(server.player_list)-1)
	network_send_udp(server.socket,_ip,_port,send_buffer,buffer_tell(send_buffer))
	//show_message("server sent mid1")
}	