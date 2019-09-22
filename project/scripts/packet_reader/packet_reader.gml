var buffer = argument[0]
var mid = buffer_read(buffer,buffer_u8)
switch(mid) {
	case 0:		// Sign In Request
		var _priority = buffer_read(buffer,buffer_u8)
		var _name = buffer_read(buffer,buffer_string)
		
		if ds_list_find_index(network.playerList,_name) == -1 {
			ds_list_add(network.playerList,_name)
		}
		
		if instance_exists(server) {
			if server.remote_ip != network.ip {
				ds_list_add(server.ip_list,server.remote_ip)
				ds_list_add(server.port_list,server.remote_port)
				ds_queue_enqueue(server.packet_queue_hp,buffer)	
			}
		} else {
				
		}
	
		//buffer_write(send_buffer,buffer_u8,1)
		//buffer_write(send_buffer,buffer_string,name)
	
	break;
	case 1:
		//var packet = buffer_read(buffer,buffer_u32)
		//var old_packet_received = network.packet_received
		//network.packet_received = packet
		
		//var _ID = buffer_read(buffer,buffer_u32)
		//var _x = buffer_read(buffer,buffer_u32)
		//var _y = buffer_read(buffer,buffer_u32)
		//var _body_angle = buffer_read(buffer,buffer_u32)
		//var _turret_angle = buffer_read(buffer,buffer_u32)
		//var _hp = buffer_read(buffer,buffer_u32)
		
		//with tank {
		//	if ID == _ID {
		//		x = _x
		//		y = _y
		//		body_angle = _body_angle
		//		turret_angle = _turret_angle
		//		_hp = hp
		//	}
		//}
		
		//if instance_number(server) > 0 and packet > old_packet_received {
		//	network_send_udp(server.socket,server.remote_ip,server.remote_port,buffer,buffer_tell(buffer))	
		//}
		
	break;
	case 2:
		var packet = buffer_read(buffer,buffer_u32)
		var _ID = buffer_read(buffer,buffer_u32)
		var _horizontal_input = buffer_read(buffer,buffer_u32)
		var _vertical_input = buffer_read(buffer,buffer_u32)
		var _mouse_left_pressed = buffer_read(buffer,buffer_u32)
		var _cursor_x = buffer_read(buffer,buffer_u32)
		var _cursor_y = buffer_read(buffer,buffer_u32)
		
		with tank {
			if ID = _ID {
				horizontal_input = _horizontal_input
				vertical_input = _vertical_input
				mouse_left_pressed = _mouse_left_pressed
				cursor_x = _cursor_x
				cursor_y = _cursor_y
			}
		}
		
		if instance_exists(server) {
			if server.remote_ip != network.ip {
				for(var i=0;i<ds_list_size(network.playerList);i++)	 {
					var _ip = ds_list_find_value(server.ip_list,i)
					var _port = ds_list_find_value(server.port_list,i)
					network_send_udp(server.socket,_ip,_port,buffer,buffer_tell(buffer))
				}
			}
		}
		
	break;
}
