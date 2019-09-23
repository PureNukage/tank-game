var buffer = argument[0]
var mid = buffer_read(buffer,buffer_u8)
switch(mid) {
	case 0:		// Server - Handshake Request
		var _packet = buffer_read(buffer,buffer_u8)
		var _name = buffer_read(buffer,buffer_string)
		
		var new_players_number = ds_list_size(server.player_list)
		
		if _packet > server.packet_in[new_players_number,0] and server.packet_in[new_players_number,0] != -1 {
			//show_message("mid 0 received!")
			//show_message(string(new_players_number))
			server.handshake[new_players_number] = 1
			server.handshake[new_players_number+1] = 0
			server.packet_in[new_players_number,mid] = -1
			ds_list_add(server.player_list,_name)
			ds_list_add(server.ip_list,server.remote_ip)
			ds_list_add(server.port_list,server.remote_port)
			for(var i=0;i<network.mids;i++) {
				server.packet_in[new_players_number,i] = -1
				server.packet_in[new_players_number+1,i] = -1
				server.packet_out[new_players_number+1,i] = -1
			}
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
		
		//show_message("Packet: "+string(_packet))		
		//show_message("ID: "+string(_ID))
		
		if server.packet_in[_ID,mid] == -1 {
			//show_message("server received mid2")
			server.packet_in[_ID,mid] = _packet
			server.handshake[_ID]++
			server.handshake[_ID]++
			for(var i=0;i<ds_list_size(server.player_list);i++) {
				server.handshake[i]--	
			}
		}	
		
		
	break;
	case 3:		//Network - Player Join
		var _player_list_compiled = buffer_read(buffer,buffer_string)
		var _ID = buffer_read(buffer,buffer_u32)
		var _player_list = ds_list_create()
		_player_list = ds_list_read(_player_list,_player_list_compiled)
		
		if handshake == 1 {
			if ds_list_size(network.player_list) < ds_list_size(_player_list) {
				var old = ds_list_size(network.player_list) 
				var new = ds_list_size(_player_list)
				for(var i=old;i<new;i++) {
					var newplayer = instance_create_layer(0,0,"Instances",tankPlayer)	
					if _ID != network.ID { 
						//instance_destroy(newplayer.input_handler)
						//newplayer.input_handler = instance_create_layer(0,0,"Instances",multiplayerInput)
					}
					newplayer.ID = i
				}
			}
			handshake++
		}

		
		
		
	break;
	case 4:		// Server - Ping 
		var _ID = buffer_read(buffer,buffer_u32)
		var _client_time = buffer_read(buffer,buffer_u32)
		
		if server.handshake[_ID] == 2 server.handshake[_ID] = 3
		
		mid5_sv_ping(_ID,_client_time)
		
	break;
	case 5:		// Network - Ping
		var _ID = buffer_read(buffer,buffer_u32)
		var _client_time_previous = buffer_read(buffer,buffer_u32)
		
		network.ping = current_time - _client_time_previous
		
	break;
	case 10:	// Server - Player Input Packet

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

	break;
}
