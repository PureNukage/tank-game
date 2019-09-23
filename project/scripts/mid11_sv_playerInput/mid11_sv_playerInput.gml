var _ID = argument[0]
var _key_right = argument[1]
var _key_left = argument[2]
var _key_up = argument[3]
var _key_down = argument[4]
var _horizontal_input = argument[5]
var _vertical_input = argument[6]
var _mouse_left_pressed = argument[7]
var _cursor_x = argument[8]
var _cursor_y = argument[9]

var _buffer = buffer_create(1024,buffer_fixed,1)
buffer_seek(_buffer,buffer_seek_start,0)
buffer_write(_buffer,buffer_u8,11)
buffer_write(_buffer,buffer_u32,_ID)
buffer_write(_buffer,buffer_u32,_key_right)
buffer_write(_buffer,buffer_u32,_key_left)
buffer_write(_buffer,buffer_u32,_key_up)
buffer_write(_buffer,buffer_u32,_key_down)
buffer_write(_buffer,buffer_u32,_horizontal_input)
buffer_write(_buffer,buffer_u32,_vertical_input)
buffer_write(_buffer,buffer_u32,_mouse_left_pressed)
buffer_write(_buffer,buffer_u32,_cursor_x)
buffer_write(_buffer,buffer_u32,_cursor_y)

return _buffer