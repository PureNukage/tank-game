var _x = 512
var _y = 15
for(var i=0;i<array_length_1d(kills);i++) {
	var _name = network.player_list[| i]
	draw_text(_x,_y,_name+": "+string(kills[i]))
	_y += 15
}