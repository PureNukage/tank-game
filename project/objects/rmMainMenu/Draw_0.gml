for(var i=0;i<2;i++) {
	if button[i,2] == 1 {
		draw_set_color(c_ltgray)			
	} else {
		draw_set_color(c_dkgray)	
	}
	
	draw_roundrect(button[i,0],button[i,1],button[i,0]+button_width,button[i,1]+button_height,false)
}

draw_set_color(c_black)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_text(button[0,0]+(button_width/2),button[0,1]+(button_height/2),"Join Game")
draw_text(button[1,0]+(button_width/2),button[1,1]+(button_height/2),"Host Game")
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_left)