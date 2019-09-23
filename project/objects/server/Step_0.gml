for(var i=0;i<ds_list_size(server.player_list);i++) {
	switch(handshake[i])
	{
		case 1:		// First Handshake
			if handshake_sent[i] != packet_out[i,1]  and (packet_out[i,1] - handshake_sent[i]) > 5 {
				//show_message("server - mid1 sent at packet "+string(packet_out[i,1]))
				mid1_sv_handshake_received(ip_list[| i],port_list[| i])
				packet_out[i,1]++
				handshake_sent[i] = packet_out[i,1]
			} else packet_out[i,1]++
			//show_message("server - mid1 packet: "+string(packet_out[i,1]))
		break;
		case 2:		//	Player Join
			mid3_sv_player_join(ip_list[| i],port_list[| i])
		break;
		case 3:		// Active Connection

		break;
	}
}