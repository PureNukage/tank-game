var _x = 512
var _y = 15
for(var i=0;i<array_length_1d(kills);i++) {
	var _name = network.player_list[| i]
	_name += ": "+string(kills[i])
	draw_set_color(c_black)
	draw_rectangle(_x-4,_y,_x+string_width(_name)+4,_y+24,false)
	draw_set_color(c_white)
	draw_text(_x,_y,_name)
	_y += 24
}