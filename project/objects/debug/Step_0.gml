if keyboard_check_pressed(vk_control) {
	var _mode = mode + 1
	if _mode >= 3 mode = 0 else mode++
}

if ds_list_size(debug.log) > 48 {
	ds_list_clear(debug.log)	
}

if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down) {
	var _direction = keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)
	if object_index_count+_direction > -1 and object_index_count+_direction < ds_list_size(objects) {
		object_index_count+=_direction
		object_id = objects[| object_index_count]
	}
}

object_variable_array = variable_instance_get_names(objects[| object_index_count])