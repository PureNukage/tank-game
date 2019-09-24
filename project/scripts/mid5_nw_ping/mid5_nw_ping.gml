with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,4)
	buffer_write(send_buffer,buffer_u32,ID)
	buffer_write(send_buffer,buffer_u32,current_time)
	network_send_udp(socket,ip,port,send_buffer,buffer_tell(send_buffer))
	//log_buffer_sent(4)
}