for(var i=0;i<2;i++) {
	if point_in_rectangle(mouse_x,mouse_y,button[i,0],button[i,1],button[i,0]+button_width,button[i,1]+button_height) {
		button[i,2] = 1	
		if mouse_check_button_pressed(mb_left) {
			switch(i) {
				case 0:
					instance_create_layer(0,0,"Instances",network)
					network.ip = get_string("Server IP:","")
					room_goto_next()
				break;
				case 1:
					instance_create_layer(0,0,"Instances",server)
					instance_create_layer(0,0,"Instances",network)
					room_goto_next()
				break;
			}
		}
		
	} else {
		button[i,2] = 0	
	}	
}
