count++
if count == 6 {
	frame_current++
	if frame_current == 7 {
		sprite_index = s_enemy_death7
		image_index = 0
	} else {
		sprite_index = frame[frame_current]
		count = 0
	}
}
