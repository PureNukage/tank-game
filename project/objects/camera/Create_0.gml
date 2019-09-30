view_enabled = true
view_set_visible(0,true)

view_set_wport(0,1024)
view_set_hport(0,768)

//window_set_rectangle((display_get_width()-view_wport[0])*0.5, (display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
//surface_resize(application_surface,view_wport[0],view_hport[0])

cam = camera_create_view(0,0,640,482,0,id,200,200,1024,768)

view_set_camera(0,cam)