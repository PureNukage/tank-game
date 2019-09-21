if point_in_rectangle(mouse_x,mouse_y,field0[0,0],field0[0,1],field0[0,0]+button_width,field0[0,1]+button_height) {
	field0[0,2] = 1	
} else {
	field0[0,2] = 0	
}

if point_in_rectangle(mouse_x,mouse_y,field1[0,0],field1[0,1],field1[0,0]+button_width,field1[0,1]+button_height) {
	field1[0,2] = 1	
} else {
	field1[0,2] = 0	
}

