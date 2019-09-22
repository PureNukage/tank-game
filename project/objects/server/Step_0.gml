for(var i=0;i<ds_list_size(network.player_list);i++) {
	switch(handshake[i])
	{
		case 1:
			mid1_sv_handshake_received()
			packet_out[i,1]++
		break;
		case 2:
			mid3_sv_player_join(ip_list[| i],port_list[| i])
		break;
	}
}