var buffer = argument[0]
var mid = buffer_read(buffer,buffer_u8)
switch(mid) {
	case 0:		// Server - Handshake Request
		var _packet = buffer_read(buffer,buffer_u8)
		var _name = buffer_read(buffer,buffer_string)
		
		var new_players_number = ds_list_size(server.player_list)
		
		if server.packet_in[new_players_number,mid] == -1 {
			show_message("mid 0 received!")
			server.handshake[new_players_number]++
			server.handshake[new_players_number+1] = 0
			server.packet_in[new_players_number,mid] = _packet
			ds_list_add(server.player_list,_name)
			ds_list_add(server.ip_list,server.remote_ip)
			ds_list_add(server.port_list,server.remote_port)
			server.packet_in[new_players_number+1,0] = -1
			server.packet_out[new_players_number+1,1] = 0
		}
		
		
	
	break;
	case 1:		//Network - Handshake Received
		var _player_count = buffer_read(buffer,buffer_u32)
		
		if network.handshake == 0 {
			network.ID = _player_count
			network.handshake++
		}
		
	break;
	case 2:		//Server - Handshake Established
		var _packet = buffer_read(buffer,buffer_u32)
		var _ID = buffer_read(buffer,buffer_u8)
		
		if packet_in[_ID] == -1 {
			server.handshake[_ID]++
		}	
		
		
	break;
	case 3:		//Network - Player Join
		var _player_list_compiled = buffer_read(buffer,buffer_string)
		var _ID = buffer_read(buffer,buffer_u32)
		var _player_list
		_player_list = ds_list_read(_player_list,_player_list_compiled)
		
		if ds_list_size(network.player_list) < ds_list_size(_player_list) {
			var old = ds_list_size(network.player_list) 
			var new = ds_list_size(_player_list)
			var difference = new - old
			for(var i=old;i<new;i++) {
				if i == _ID {
					
				} else {
					var newplayer = instance_create_layer(0,0,"Instances",tankPlayer)
					instance_destroy(newplayer.input_handler)
					newplayer.input_handler = instance_create_layer(0,0,"Instances",computerInput)
				}
				newplayer.ID = i
			}
		}

		
		
		
	break;
	case 4:

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
				for(var i=0;i<ds_list_size(network.player_list);i++)	 {
					var _ip = ds_list_find_value(server.ip_list,i)
					var _port = ds_list_find_value(server.port_list,i)
					network_send_udp(server.socket,_ip,_port,buffer,buffer_tell(buffer))
				}
			}
		}
		
	break;
}
