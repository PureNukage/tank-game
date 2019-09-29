var _attackerID = argument[0]
var _victimID = argument[1]

with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,14)
	buffer_write(send_buffer,buffer_u32,_attackerID)
	buffer_write(send_buffer,buffer_u32,_victimID)
	for(var i=0;i<player_count;i++) {
		network_send_udp(server.socket,server.ip_list[| i],server.port_list[| i],send_buffer,buffer_tell(send_buffer))	
	}
	//log_buffer_sent(7)
}