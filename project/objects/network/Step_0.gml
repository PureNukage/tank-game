//if sign_in_received = 0 {
//	buffer_seek(send_buffer,buffer_seek_start,0)
//	buffer_write(send_buffer,buffer_u8,0)
//	buffer_write(send_buffer,buffer_u32,packet)
//	buffer_write(send_buffer,buffer_string,name)
//	buffer_write(send_buffer,buffer_u32,-1)
//	network_send_udp(socket,url,port,send_buffer,buffer_tell(send_buffer))
//	packet++	
//}

if ds_queue_size(packet_queue_lp) > 0 {
	network_send_udp(socket,ip,port,ds_queue_dequeue(packet_queue_lp),buffer_tell(ds_queue_dequeue(packet_queue_lp)))	
}

if ds_queue_size(packet_queue_hp) > 0 {
	network_send_udp(socket,ip,port,ds_queue_head(packet_queue_hp),buffer_tell(ds_queue_head(packet_queue_hp)))			
}

