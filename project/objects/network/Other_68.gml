if !instance_exists(server) {

	var buffer = async_load[? "buffer"]
	buffer_seek(buffer,buffer_seek_start,0)
	packet_reader(buffer)
	
}