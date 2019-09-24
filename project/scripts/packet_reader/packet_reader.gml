var buffer = argument[0]
var mid = buffer_read(buffer,buffer_u8)
switch(mid) {
	case 0:		// Server - Handshake Request
		var _packet = buffer_read(buffer,buffer_u8)
		var _name = buffer_read(buffer,buffer_string)
		
		var new_players_number = ds_list_size(server.player_list)
		
		if server.handshake[new_players_number] == 0 and server.packet_in[new_players_number,0] == -1 {

			var _string = "server - received " + script_get_name(mid+2)
			ds_list_add(debug.log,_string)

			server.handshake[new_players_number] = 1
			server.handshake[new_players_number+1] = 0
			server.packet_in[new_players_number,mid] = _packet
			ds_list_add(server.player_list,_name)
			ds_list_add(server.ip_list,server.remote_ip)
			ds_list_add(server.port_list,server.remote_port)
			for(var i=0;i<network.mids;i++) {
				server.packet_in[new_players_number,i] = -1
				server.packet_in[new_players_number+1,i] = -1
				server.packet_out[new_players_number+1,i] = -1
				server.handshake_sent[new_players_number+1] = -1
			}
		} else {
			
			var _string_adv = "server - received " + script_get_name(mid+2) + " extra packet tossed"
			ds_list_add(debug.log,_string_adv)		
			
		}
		
		
	
	break;
	case 1:		//Network - Handshake Received
		var _player_count = buffer_read(buffer,buffer_u32)		
		
		if network.handshake == 0 {
			var _string = "network - received " + script_get_name(mid+2)
			ds_list_add(debug.log,_string)
			network.ID = _player_count
			network.handshake++
		} else {
			
			var _string_adv = "network - received " + script_get_name(mid+2) + " extra packet tossed"
			ds_list_add(debug.log,_string_adv)	
			
		}
		
	break;
	case 2:		//Server - Handshake Established
		var _packet = buffer_read(buffer,buffer_u32)
		var _ID = buffer_read(buffer,buffer_u8)	
		
		if server.packet_in[_ID,mid] == -1 {
			
			var _string = "server - received " + script_get_name(mid+2)
			ds_list_add(debug.log,_string)			
			
			server.packet_in[_ID,mid] = _packet
			server.handshake[_ID]++
			server.handshake[_ID]++
			for(var i=0;i<ds_list_size(server.player_list);i++) {
				server.handshake[i]--
				var _string2 = "server.handshake["+string(i)+"] = " +string(server.handshake[i])
				ds_list_add(debug.log,_string2)
			}
		}	else {
			var _string_adv = "server - received " + script_get_name(mid+2) + " extra packet tossed"
			ds_list_add(debug.log,_string_adv)		
		}
		
		
	break;
	case 3:		//Network - Player Join
		var _player_list_compiled = buffer_read(buffer,buffer_string)
		var _ID = buffer_read(buffer,buffer_u32)
		var _player_list = ds_list_create()
		ds_list_read(_player_list,_player_list_compiled)		
		
		if network.handshake == 1 {
			
			var old = ds_list_size(network.player_list) 
			var new = ds_list_size(_player_list)			
			
			var _string = "network - received " + script_get_name(mid+2)			
			ds_list_add(debug.log,_string)
			_string = "network - mid3scan - new player count: " +string(new)
			ds_list_add(debug.log,_string)
			
			if ds_list_size(network.player_list) < ds_list_size(_player_list) {
				network.player_count = new
				for(var i=old;i<new;i++) {
					var newplayer = instance_create_layer(0,0,"Instances",tankPlayer)
					var _string = "network - welcome, player " +string(i)
					ds_list_add(debug.log,_string)
					if _ID != network.ID { 
						//instance_destroy(newplayer.input_handler)
						//newplayer.input_handler = instance_create_layer(0,0,"Instances",multiplayerInput)
					}
					newplayer.ID = i
				}
			}
			network.handshake++
		} else {
			
			var _string_adv = "network - received " + script_get_name(mid+2) + " extra packet tossed"
			ds_list_add(debug.log,_string_adv)	
				
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
	
		//show_message("received mid10")

		var _ID = buffer_read(buffer,buffer_u32)
		var _key_right = buffer_read(buffer,buffer_u32)
		var _key_left = buffer_read(buffer,buffer_u32)
		var _key_up = buffer_read(buffer,buffer_u32)
		var _key_down = buffer_read(buffer,buffer_u32)
		var _mouse_left_pressed = buffer_read(buffer,buffer_u32)
		var _cursor_x = buffer_read(buffer,buffer_u32)
		var _cursor_y = buffer_read(buffer,buffer_u32)
		
		var _buffer = mid11_sv_playerInput(_ID,_key_right,_key_left,_key_up,_key_down,
		_mouse_left_pressed,_cursor_x,_cursor_y)
		
		for(var i=0;i<ds_list_size(server.player_list);i++) {
			var _string = "server - mid11scan ID: "+string(i)
			//ds_list_add(debug.log,_string)
			network_send_udp(server.socket,server.ip_list[| i],server.port_list[| i],_buffer,buffer_tell(_buffer))
			//log_buffer_sent(11)
		}

	break;
	case 11:	// Network - Player Input Packet
		var _ID = buffer_read(buffer,buffer_u32)
		var _key_right = buffer_read(buffer,buffer_u32)
		var _key_left = buffer_read(buffer,buffer_u32)
		var _key_up = buffer_read(buffer,buffer_u32)
		var _key_down = buffer_read(buffer,buffer_u32)
		var _mouse_left_pressed = buffer_read(buffer,buffer_u32)
		var _cursor_x = buffer_read(buffer,buffer_u32)
		var _cursor_y = buffer_read(buffer,buffer_u32)
		
		with tank {
			if ID == _ID { 
				input_handler.key_right = _key_right
				input_handler.key_left = _key_left
				input_handler.key_up = _key_up
				input_handler.key_down = _key_down
				input_handler.mouse_left_pressed = _mouse_left_pressed
				input_handler.cursor_x = _cursor_x
				input_handler.cursor_y = _cursor_y
			}
		}
	break;
}
