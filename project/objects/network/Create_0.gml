packet = 0
packet_received = 0
packet_queue_hp = ds_queue_create()
packet_queue_lp = ds_queue_create()
ip = "127.0.0.1"
port = 7000
socket = network_create_socket(network_socket_udp)
name = get_string("Nickname","")
player_list = ds_list_create()
handshake = 0

send_buffer = buffer_create(1024,buffer_fixed,1)

