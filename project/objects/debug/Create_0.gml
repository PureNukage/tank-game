mode = 0
object_index_count = 0
objects = ds_list_create()
ds_list_add(objects,runtime.id)
object_id = objects[| 0]
object_variable_array = variable_instance_get_names(object_id)
log = ds_list_create()