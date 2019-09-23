for(var i=0;i<ds_list_size(server.player_list);i++) {
	switch(handshake[i])
	{
		case 1:		// First Handshake
			mid1_sv_handshake_received(ip_list[| i],port_list[| i])
			packet_out[i,1]++
		break;
		case 2:		//	Player Join
			mid3_sv_player_join(ip_list[| i],port_list[| i])
		break;
		case 3:		// Active Connection
			if ds_queue_size(packet_queue_lp) > 0 {
				for(var i=0;i<ds_list_size(server.player_list);i++) {
					var _buffer = ds_queue_head(packet_queue_lp)
					network_send_udp(socket,ip_list[| i],port_list[| i],_buffer,buffer_tell(_buffer))
				}
				var tossed_packet = ds_queue_dequeue(packet_queue_lp)
			}
		break;
	}
}