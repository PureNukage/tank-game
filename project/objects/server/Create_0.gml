port = 7000
socket = network_create_socket_ext(network_socket_udp,port)

remote_ip = 0
remote_port = 0

packet_queue_hp = ds_queue_create()
packet_queue_lp = ds_queue_create()

packet = 0
packet_in[0,0] = -1
packet_out[0,0] = -1
packet_out[0,1] = -1
handshake[0] = 0
handshake_sent[0] = 0		//	handshake_sent[ID] = packet
player_list = ds_list_create()
ip_list = ds_list_create()
port_list = ds_list_create()

ds_list_add(debug.objects,id)