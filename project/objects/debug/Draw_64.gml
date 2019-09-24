switch(mode)
{	
	case 0:
	
	break;
	case 1:
		var _y = 15
		for(var i=0;i<array_length_1d(object_variable_array);i++) {
			var str = string(object_variable_array[i]) + " : " + string(variable_instance_get(object_id,object_variable_array[i]))
			draw_text(15,_y,str)
			_y += 15
		}
	break;
	case 2:
		var _y = 748
		for(var i=0;i<ds_list_size(debug.log);i++) {
			var str = ds_list_find_value(debug.log,i)
			draw_text(15,_y,str)
			_y -= 15
		}
	break;
}

draw_set_halign(fa_right)
draw_text(1010,15,"object_name: " +string(object_get_name(object_id.object_index)))
draw_text(1010,30,"debug mode: "+string(mode))
draw_text(1010,45,"current object: "+string(object_index_count) + " / " +string(ds_list_size(objects)))
draw_set_halign(fa_left)