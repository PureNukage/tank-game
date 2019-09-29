var _ID = argument[0]
var _client_time = argument[1]

with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,6)
	buffer_write(send_buffer,buffer_u32,_ID)
	buffer_write(send_buffer,buffer_u32,_client_time)
	network_send_udp(server.socket,server.ip_list[| _ID],server.port_list[| _ID],send_buffer,buffer_tell(send_buffer))
	//log_buffer_sent(5)
}