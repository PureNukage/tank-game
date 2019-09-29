remote_ip = async_load[? "ip"]
remote_port = async_load[? "port"]

var buffer = async_load[? "buffer"]
buffer_seek(buffer,buffer_seek_start,0)
packet_reader(buffer)