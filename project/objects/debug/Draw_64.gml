var _y = 15
for(var i=0;i<array_length_1d(object_variable_array);i++) {
	var str = string(object_variable_array[i]) + " : " + string(variable_instance_get(object_id,object_variable_array[i]))
	draw_text(15,_y,str)
	_y += 15
}

draw_set_halign(fa_right)
draw_text(1010,15,"object_name: " +string(object_get_name(object_id.object_index)))
draw_text(1010,30,"object count: "+string(object_index_count))
draw_set_halign(fa_left)