// Inherit the parent event
event_inherited();

if hp <= 0 {
	show_message("You died!")
	game_restart()
}

if mid2 == 4 {
	mid2_tank_event()
	mid2 = 0
} else mid2++

//buffer_seek(buffer,buffer_seek_start,0)
//buffer_write(buffer,buffer_u8,1)
//buffer_write(buffer,buffer_u32,network.packet)
//buffer_write(buffer,buffer_u32,ID)
//buffer_write(buffer,buffer_u32,x)
//buffer_write(buffer,buffer_u32,y)
//buffer_write(buffer,buffer_u32,body_angle)
//buffer_write(buffer,buffer_u32,turret_angle)
//buffer_write(buffer,buffer_u32,hp)
//network_send_udp(network.socket,network.url,network.port,buffer,buffer_tell(buffer))
//network.packet++
