if field0[0,2] = 1 {
	draw_set_color(c_ltgray)	
} else {
	draw_set_color(c_dkgray)	
}
draw_roundrect(field0[0,0],field0[0,1],field0[0,0]+button_width,field0[0,1]+button_height,false)

if field1[0,2] = 1 {
	draw_set_color(c_ltgray)	
} else {
	draw_set_color(c_dkgray)	
}
draw_roundrect(field1[0,0],field1[0,1],field1[0,0]+button_width,field1[0,1]+button_height,false)

draw_set_color(c_black)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_text(field0[0,0]+(button_width/2),field0[0,1]+(button_height/2),"Join Game")
draw_text(field1[0,0]+(button_width/2),field1[0,1]+(button_height/2),"Host Game")
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_left)