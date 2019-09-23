with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,2)
	buffer_write(send_buffer,buffer_u32,packet)
	buffer_write(send_buffer,buffer_u8,ID)
	network_send_udp(socket,ip,port,send_buffer,buffer_tell(send_buffer))
	show_message("network sent mid2")
}	