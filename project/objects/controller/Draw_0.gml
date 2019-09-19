if o_tank.target_out_of_range == true {
	cursor_color = c_red	
} else {
	cursor_color = c_green	
}

draw_sprite_ext(s_cursor,0,mouse_x,mouse_y,image_xscale,image_yscale,0,cursor_color,1)