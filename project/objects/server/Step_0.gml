if ds_queue_size(packet_queue_hp) > 0 {
	for(var i=0;i<ds_list_size(network.playerList);i++)	 {
		var _ip = ds_list_find_value(server.ip_list,i)
		var _port = ds_list_find_value(server.port_list,i)
		if _ip != network.ip {
			network_send_udp(server.socket,_ip,_port,ds_queue_head(packet_queue_hp),buffer_tell(ds_queue_head(packet_queue_hp)))
		}
	}
}