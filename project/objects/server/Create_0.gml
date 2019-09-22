port = 7000
socket = network_create_socket_ext(network_socket_udp,port)

remote_ip = 0
remote_port = 0

packet_queue_hp = ds_queue_create()
packet_queue_lp = ds_queue_create()

ip_list = ds_list_create()
port_list = ds_list_create()