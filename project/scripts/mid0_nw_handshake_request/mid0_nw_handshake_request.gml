with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,0)
	buffer_write(send_buffer,buffer_u8,packet)
	buffer_write(send_buffer,buffer_string,name)
	network_send_udp(network.socket,network.ip,network.port,send_buffer,buffer_tell(send_buffer))
}