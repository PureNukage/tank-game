ping = 0
packet = 0
packet_received = 0
packet_queue_hp = ds_queue_create()
packet_queue_lp = ds_queue_create()
ip = "127.0.0.1"
port = 7000
port_client = get_integer("Port: ",7001)
socket = network_create_socket_ext(network_socket_udp,port_client)
name = get_string("Nickname","")
player_list = ds_list_create()
handshake = 0
mids = 4

send_buffer = buffer_create(1024,buffer_fixed,1)

var player_input = instance_create_layer(0,0,"Instances",playerInput)

