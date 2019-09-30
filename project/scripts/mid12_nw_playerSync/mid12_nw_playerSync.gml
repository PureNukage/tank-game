var _x = argument[0]
var _y = argument[1]
var _body_angle = argument[2]
var _turret_angle = argument[3]
var _hp = argument[4]

with network {
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,12)
	buffer_write(send_buffer,buffer_u32,ID)
	buffer_write(send_buffer,buffer_u32,_x)
	buffer_write(send_buffer,buffer_u32,_y)
	buffer_write(send_buffer,buffer_s32,_body_angle)
	buffer_write(send_buffer,buffer_s32,_turret_angle)
	buffer_write(send_buffer,buffer_u32,_hp)
	network_send_udp(socket,ip,port,send_buffer,buffer_tell(send_buffer))
	//log_buffer_sent(7)
}