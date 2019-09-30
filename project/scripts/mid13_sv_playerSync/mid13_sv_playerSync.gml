var _ID = argument[0]
var _x = argument[1]
var _y = argument[2]
var _body_angle = argument[3]
var _turret_angle = argument[4]
var _hp = argument[5]

with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,13)
	buffer_write(send_buffer,buffer_u32,_ID)
	buffer_write(send_buffer,buffer_u32,_x)
	buffer_write(send_buffer,buffer_u32,_y)
	buffer_write(send_buffer,buffer_s32,_body_angle)
	buffer_write(send_buffer,buffer_s32,_turret_angle)
	buffer_write(send_buffer,buffer_u32,_hp)

	//log_buffer_sent(7)
	
	for(var i=0;i<player_count;i++) {
		network_send_udp(server.socket,server.ip_list[| i],server.port_list[| i],send_buffer,buffer_tell(send_buffer))	
	}
	
}