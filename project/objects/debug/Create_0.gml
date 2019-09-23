mode = false
object_index_current = server
object_index_count = 0
object = ds_list_create()
if instance_exists(server) ds_list_add(object,server.id)
ds_list_add(object,network.id)
ds_list_add(object,playerInput.id)
object_id = object[| object_index_count]
object_variable_array = variable_instance_get_names(object_id)