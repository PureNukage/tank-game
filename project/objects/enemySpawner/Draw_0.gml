if flash > 0 {
	shader_set(shader_flashWhite)
	for (var i = 0; i < image_number; i++) {
	draw_sprite_ext(sprite_index, i, x, y - i, image_xscale, image_yscale, image_angle, c_white, .5);
	}
	shader_reset()
} else {
	for (var i = 0; i < image_number; i++) {
	draw_sprite_ext(sprite_index, i, x, y - i, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	}	
}