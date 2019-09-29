with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,10)
	buffer_write(send_buffer,buffer_u32,ID)
	buffer_write(send_buffer,buffer_u32,playerInput.key_right)
	buffer_write(send_buffer,buffer_u32,playerInput.key_left)
	buffer_write(send_buffer,buffer_u32,playerInput.key_up)
	buffer_write(send_buffer,buffer_u32,playerInput.key_down)
	buffer_write(send_buffer,buffer_u32,playerInput.mouse_left_pressed)
	buffer_write(send_buffer,buffer_u32,playerInput.cursor_x)
	buffer_write(send_buffer,buffer_u32,playerInput.cursor_y)
	network_send_udp(socket,ip,port,send_buffer,buffer_tell(send_buffer))
	//log_buffer_sent(7)
}