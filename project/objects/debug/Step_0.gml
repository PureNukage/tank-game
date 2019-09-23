if keyboard_check_pressed(vk_control) {
	mode = !mode	
}

if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down) {
	var _direction = keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)
	if object_index_count+_direction > -1 and object_index_count+_direction < ds_list_size(object) {
		object_index_count+=_direction
		object_variable_array = variable_instance_get_names(object[| object_index_count])
		object_id = object[| object_index_count]
	}
}

