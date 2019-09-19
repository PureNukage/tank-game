for (var i = 0; i < image_number; i++) {
	draw_sprite_ext(sprite_index, i, x, y - i, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}

for(var i=0;i<13;i++) {
	draw_sprite_ext(s_tank1_turret,i,x,(y-16)-i,image_xscale,image_yscale,turret_angle,c_white,image_alpha)	
}

//draw_text(15,15,"direction: " +string(direction))