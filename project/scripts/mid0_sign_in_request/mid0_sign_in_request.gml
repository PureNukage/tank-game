with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,0)
	buffer_write(send_buffer,buffer_u8,1)
	buffer_write(send_buffer,buffer_string,name)
	packet++
}